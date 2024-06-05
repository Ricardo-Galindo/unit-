import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';
import 'package:unit_mais/local_details/local_details_page.dart';
import 'package:unit_mais/login/login_page.dart';
import 'package:unit_mais/user_details/user_details_page.dart';
import 'package:unit_mais/widgets/CustomAppBar.dart';
import 'package:unit_mais/widgets/circular_loading.dart';
import 'package:unit_mais/widgets/information_card.dart';

import '../Classes/Venue.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<Venue> venues = [];
  String searchedVenue = "";

  Future<void> _fetchData() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('Venue').get();
      querySnapshot.docs.forEach((doc) {
        setState(() {
          venues.add(Venue.fromJson(doc.data() as Map<String, dynamic>));
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: venues.isEmpty
            ? CircularLoading(
                color: kPrimaryColor,
              )
            : Center(
                child: Container(
                  color: Colors.white,
                  constraints: BoxConstraints(maxWidth: 500),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      CustomAppBar(
                        shouldShow: false,
                        onTap: () {
                          _auth.currentUser?.uid != null
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UserDetailsPage(),
                                  ),
                                )
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(152, 152, 152, 0.2)),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchedVenue = value;
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: Color(0xFF9E9E9E),
                              ),
                              hintText: "   Pesquisar local",
                              hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFF9E9E9E)),
                              border: InputBorder.none),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: searchedVenue.isEmpty
                              ? venues
                                  .map(
                                    (venue) => InformationCard(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  VenueDetailsPage(
                                                venue: venue,
                                              ),
                                            ),
                                          );
                                        },
                                        title: venue.name,
                                        commentary: venue.subtitle,
                                        description: venue.description),
                                  )
                                  .toList()
                              : venues
                                  .where((venue) => venue.name
                                      .toLowerCase()
                                      .contains(searchedVenue.toLowerCase()))
                                  .map((venue) => InformationCard(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                VenueDetailsPage(
                                              venue: venue,
                                            ),
                                          ),
                                        );
                                      },
                                      title: venue.name,
                                      commentary: venue.subtitle,
                                      description: venue.description))
                                  .toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
