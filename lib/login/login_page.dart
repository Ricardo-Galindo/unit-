import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';
import 'package:unit_mais/home/home_page.dart';
import 'package:unit_mais/register/register_page.dart';

import '../widgets/CustomButton.dart';
import '../widgets/CustomTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          width: double.infinity,
          child: Center(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30),
              constraints: BoxConstraints(maxWidth: 500),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/unit+.png'),
                    Text(
                      'Bem vindo',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Faça login em sua conta',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 62),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                color: Colors.black),
                          ),
                          CustomTextField(
                            onSubmitted: (value) {},
                            hintText: 'email',
                            icon: Icons.mail,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 37),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Senha',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                color: Colors.black),
                          ),
                          CustomTextField(
                            onSubmitted: (value) {},
                            hintText: 'senha',
                            icon: Icons.lock,
                          )
                        ],
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      margin: 66,
                      text: 'Entrar',
                      textColor: Colors.white,
                      buttonColor: kPrimaryColor,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Não possui conta?',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: 'Roboto',
                                fontSize: 16),
                          ),
                          CustomButton(
                            margin: 5,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            text: 'Criar conta',
                            textColor: Colors.white,
                            buttonColor: kPrimaryColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
