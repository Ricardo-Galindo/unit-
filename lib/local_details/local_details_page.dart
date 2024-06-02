import 'package:flutter/material.dart';
import 'package:unit_mais/Classes/Venue.dart';
import 'package:unit_mais/constants.dart';
import 'package:unit_mais/user_details/user_details_page.dart';
import 'package:unit_mais/widgets/CustomAppBar.dart';

class VenueDetailsPage extends StatelessWidget {
  VenueDetailsPage({required this.venue});

  final Venue venue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Center(
          child: Container(
            color: Colors.white,
            constraints: BoxConstraints(maxWidth: 500),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                      shouldShow: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailsPage(),
                          ),
                        );
                      }),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5, 1.0],
                            colors: [
                              Colors.transparent,
                              Color.fromRGBO(0, 0, 0, 0.54),
                              Color.fromRGBO(0, 0, 0, 1.0)
                            ],
                          ),
                        ),
                        child: Image.network(
                          venue.image,
                          scale: 1,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 5, left: 14),
                        height: 42,
                        color: kPrimaryColor,
                        child: Text(
                          venue.name,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  DetailsCard(
                    weekdayHours: venue.weekdayHours,
                    weekendHours: venue.weekendHours,
                    location: venue.location,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  DetailsCard(
      {required this.weekdayHours,
      required this.weekendHours,
      required this.location});

  final String weekdayHours;
  final String weekendHours;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 51),
      height: 280,
      padding: EdgeInsets.only(left: 14, top: 16, right: 23, bottom: 32),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              child: Text(
                "Horario de funcionamento:\n  -segunda a sexta: $weekdayHours\n  -sabádo: $weekendHours",
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 12),
              child: Text(
                "Localização: $location.",
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
