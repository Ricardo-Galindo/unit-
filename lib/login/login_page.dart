import 'package:firebase_auth/firebase_auth.dart';
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
  final _form = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String emailError = "";
  String passwordError = "";
  bool isLoading = false;

  String? validateEmail(String? value) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return "Este campo é obrigatório";
    } else if (!emailRegex.hasMatch(value)) {
      return "*E-mail inválido";
    } else if (emailError.isNotEmpty) {
      return emailError;
    } else {
      return null;
    }
  }

  signInWithEmailAndPassword(String email, String password) async {
    try {
      setState(() {
        isLoading = true;
      });
      final FirebaseAuth _auth = FirebaseAuth.instance;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Login com sucesso: ${userCredential.user!.email}");
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-credential') {
        setState(() {
          emailError = "Email não registrado.";
          _form.currentState!.validate();
        });
        print(e.code);
      } else if (e.code == 'wrong-password') {
        setState(() {
          password = "Senha incorreta.";
          _form.currentState!.validate();
        });
        print(e.code);
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
              padding: EdgeInsets.symmetric(horizontal: 30),
              constraints: BoxConstraints(maxWidth: 500),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Form(
                  key: _form,
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
                              onSaved: (value) {
                                email = value!;
                              },
                              hintText: 'email',
                              validate: (value) => validateEmail(value),
                              icon: Icons.mail,
                              isPasswordField: false,
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
                              onSaved: (value) {
                                password = value!;
                              },
                              hintText: 'senha',
                              validate: (_) => passwordError.isNotEmpty
                                  ? passwordError
                                  : null,
                              icon: Icons.lock,
                              isPasswordField: true,
                            )
                          ],
                        ),
                      ),
                      CustomButton(
                        onTap: () async {
                          emailError = "";
                          passwordError = "";
                          if (_form.currentState!.validate()) {
                            _form.currentState!.save();
                            await signInWithEmailAndPassword(email, password);
                            if (emailError.isEmpty || password.isEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                          } else {
                            print("Deu errado!");
                          }
                        },
                        isLoading: isLoading,
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
                              isLoading: false,
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
            ),
          )),
    );
  }
}
