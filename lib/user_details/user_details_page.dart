import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';
import 'package:unit_mais/widgets/CustomButton.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Center(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 46),
            constraints: BoxConstraints(maxWidth: 500),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 159,
                        width: 172,
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: Container(),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Alterar foto',
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: kPrimaryColor),
                        ),
                      ),
                      SizedBox(height: 36),
                      Divider(
                        color: kPrimaryColor,
                      ),
                      InformationField(
                          fieldName: "Nome", information: "Ricardo"),
                      Divider(
                        color: kPrimaryColor,
                      ),
                      InformationField(
                          fieldName: "Sobrenome", information: "Galindo"),
                      Divider(
                        color: kPrimaryColor,
                      ),
                      InformationField(
                          fieldName: "Periodo", information: "Sétimo"),
                      Divider(
                        color: kPrimaryColor,
                      ),
                      InformationField(
                          fieldName: "Curso",
                          information: "Sistemas de informação"),
                      Divider(
                        color: kPrimaryColor,
                      ),
                      CustomButton(
                          margin: 80,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          text: "Voltar",
                          textColor: Colors.white,
                          buttonColor: kPrimaryColor)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InformationField extends StatefulWidget {
  const InformationField({required this.fieldName, required this.information});

  final String fieldName;
  final String information;

  @override
  State<InformationField> createState() => _InformationFieldState();
}

class _InformationFieldState extends State<InformationField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.fieldName,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: kPrimaryColor,
                fontWeight: FontWeight.normal),
          ),
          Text(
            widget.information,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: kPrimaryColor,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
