import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unit_mais/local_details/local_details_page.dart';
import 'package:unit_mais/login/login_page.dart';
import 'package:unit_mais/widgets/CustomAppBar.dart';
import 'package:unit_mais/widgets/information_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> locals = [
    {
      "title": "Bloco A",
      "commentary": "O bloco dos cursos de TI",
      "description":
          "Aqui você encontra o unit carreiras, o innovation e a coordenação dos cursos EAD."
    },
    {
      "title": "DAAF - DEP. DE ASSUNTOS ACAD. E FIN",
      "commentary": "Lugar para resolver seus problemas da faculdade",
      "description":
          "Aqui você encontra os auditórios A e B e uma lanchonete na entrada do bloco."
    },
    {
      "title": "Mini shopping",
      "commentary": "Área de Lazer e entretenimento",
      "description": "Lugar perfeito para socializar e matar a fome."
    }
  ];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _fetchData() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('Venue').get();
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

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
            child: Column(
              children: [
                CustomAppBar(
                  shouldShow: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(152, 152, 152, 0.2)),
                  child: TextField(
                    onChanged: (value) {},
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
                    children: locals
                        .map(
                          (local) => InformationCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LocalDetailsPage(),
                                  ),
                                );
                              },
                              title: local["title"],
                              commentary: local["commentary"],
                              description: local["description"]),
                        )
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
