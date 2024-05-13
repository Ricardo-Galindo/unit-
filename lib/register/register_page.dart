import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';
import 'package:unit_mais/widgets/CustomButton.dart';

import '../widgets/CustomTextField.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Center(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 40),
            constraints: BoxConstraints(maxWidth: 500),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 48),
                  Text(
                    'Criar conta',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 32,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Por favor, informe seus dados',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'nome',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              color: Colors.black),
                        ),
                        CustomTextField(
                          onSubmitted: (value) {},
                          hintText: 'nome',
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'sobrenome',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              color: Colors.black),
                        ),
                        CustomTextField(
                          onSubmitted: (value) {},
                          hintText: 'sobrenome',
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'email',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              color: Colors.black),
                        ),
                        CustomTextField(
                          onSubmitted: (value) {},
                          hintText: 'email',
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'confirmar senha',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              color: Colors.black),
                        ),
                        CustomTextField(
                          onSubmitted: (value) {},
                          hintText: 'confirmar senha',
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    margin: 49,
                    onTap: () {},
                    text: 'Registrar',
                    textColor: Colors.white,
                    buttonColor: kPrimaryColor,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 75),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Já possui uma conta?',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.normal),
                        ),
                        CustomButton(
                          margin: 0,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          text: 'Login',
                          textColor: kPrimaryColor,
                          buttonColor: Color.fromARGB(35, 32, 157, 139),
                        )
                      ],
                    ),
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
