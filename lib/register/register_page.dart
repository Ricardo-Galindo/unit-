import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';
import 'package:unit_mais/widgets/CustomButton.dart';

import '../login/login_page.dart';
import '../widgets/CustomTextField.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _form = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String name = "";
  String lastName = "";
  String email = "";
  String password = "";
  String emailError = "";
  String passwordError = "";
  bool isLoading = false;

  registerAndIsertUser(String email, String password) async {
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore.collection('Users').doc().set({
        'id': newUser.user!.uid,
        'nome': name.trim(),
        'sobrenome': lastName.trim(),
        'email': email.trim(),
        'imagem': "",
        'curso': "",
        'periodo': "",
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          passwordError = 'A senha fornecida é muito fraca.';
          _form.currentState!.validate();
        });
        print(e.code);
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          emailError = 'A conta já existe para esse e-mail.';
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

  String? validateString(String? value, String? fieldName) {
    final RegExp valueWithRegex =
        RegExp(r'^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$');
    if (value == null || value.isEmpty) {
      return "Este campo é obrigatório";
    } else if (value.length < 2) {
      return "*$fieldName deve conter no mínimo 2 caracteres";
    } else if (value.length > 100) {
      return "*$fieldName deve possuir menos de 100 caracteres";
    } else if (!valueWithRegex.hasMatch(value)) {
      return "*$fieldName inválido";
    } else {
      return null;
    }
  }

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
              child: Form(
                key: _form,
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
                            onSaved: (value) {
                              name = value!;
                            },
                            hintText: 'nome',
                            validate: (value) =>
                                validateString(value?.trim(), "nome"),
                            icon: Icons.edit,
                            isPasswordField: false,
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
                            onSaved: (value) {
                              lastName = value!;
                            },
                            hintText: 'sobrenome',
                            validate: (value) =>
                                validateString(value?.trim(), "sobrenome"),
                            icon: Icons.edit,
                            isPasswordField: false,
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
                            onSaved: (value) {
                              email = value!;
                            },
                            hintText: 'email',
                            validate: (value) => validateEmail(value?.trim()),
                            icon: Icons.mail,
                            isPasswordField: false,
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
                            'senha',
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
                            validate: (_) =>
                                passwordError.isNotEmpty ? passwordError : null,
                            icon: Icons.lock,
                            isPasswordField: true,
                          )
                        ],
                      ),
                    ),
                    CustomButton(
                      margin: 49,
                      onTap: () async {
                        passwordError = "";
                        emailError = "";
                        if (_form.currentState!.validate()) {
                          print("validou!");
                          _form.currentState!.save();
                          await registerAndIsertUser(email, password);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        } else {
                          print("deu errado!");
                        }
                      },
                      isLoading: isLoading,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            isLoading: false,
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
      ),
    );
  }
}
