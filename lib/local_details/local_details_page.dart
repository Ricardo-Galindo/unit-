import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';
import 'package:unit_mais/user_details/user_details_page.dart';
import 'package:unit_mais/widgets/CustomAppBar.dart';

class LocalDetailsPage extends StatelessWidget {
  const LocalDetailsPage({super.key});

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
                        child: Image.asset('assets/images/daaf.jpg'),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 5, left: 14),
                        height: 42,
                        color: kPrimaryColor,
                        child: Text(
                          "DAAF - DEP. DE ASSUNTOS ACAD. E FIN",
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
                  DetailsCard()
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
  const DetailsCard({super.key});

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
                "Horario de funcionamento:\n  -segunda a sexta: 8h00 as 22h00\n  -sabádo: 8h00 as 12h00",
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 12),
              child: Text(
                "Localização: Dentro do prédio da reitoria. Primeira porta a esquerda.",
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
