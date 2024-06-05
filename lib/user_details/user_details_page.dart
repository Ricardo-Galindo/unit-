import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';
import 'package:unit_mais/widgets/CustomButton.dart';
import 'package:unit_mais/widgets/circular_loading.dart';

import '../Classes/Student.dart';
import '../login/login_page.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final _form = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Student? student;
  Student? originalData;
  bool isLoading = false;
  bool isUpdating = false;

  Future<void> _fetchStudentData() async {
    try {
      setState(() {
        isLoading = true;
      });

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('Users').get();

      querySnapshot.docs.forEach((doc) {
        if (doc.data()["id"] == _auth.currentUser!.uid) {
          student = Student.fromJson(doc.data());
          originalData = Student.fromJson(doc.data());
        }
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool hasDataChanged() {
    if (originalData!.nome != student!.nome ||
        originalData!.periodo != student!.periodo ||
        originalData!.curso != student!.curso ||
        originalData!.sobrenome != student!.sobrenome) {
      return true;
    } else {
      return false;
    }
  }

  updateUserInfo() async {
    try {
      setState(() {
        isUpdating = true;
      });

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('Users').get();

      querySnapshot.docs.forEach((doc) {
        if (doc.data()["id"] == _auth.currentUser!.uid) {
          doc.reference.update({
            "nome": student!.nome,
            "sobrenome": student!.sobrenome,
            "curso": student!.curso,
            "periodo": student!.periodo
          });
          setState(() {
            student = Student.fromJson(doc.data());
          });
        }
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isUpdating = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchStudentData();
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
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 46),
            constraints: BoxConstraints(maxWidth: 500),
            alignment: Alignment.topCenter,
            child: isLoading
                ? CircularLoading(color: kPrimaryColor)
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Icon(
                              Icons.arrow_back,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        Form(
                          key: _form,
                          child: Column(
                            children: [
                              Container(
                                height: 159,
                                width: 172,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
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
                                  onSaved: (value) {
                                    student!.nome = value!;
                                  },
                                  fieldName: "Nome",
                                  information: student!.nome),
                              Divider(
                                color: kPrimaryColor,
                              ),
                              InformationField(
                                  onSaved: (value) {
                                    student!.sobrenome = value!;
                                  },
                                  fieldName: "Sobrenome",
                                  information: student!.sobrenome),
                              Divider(
                                color: kPrimaryColor,
                              ),
                              InformationField(
                                  onSaved: (value) {
                                    student!.periodo = value!;
                                  },
                                  fieldName: "Periodo",
                                  information: student!.periodo),
                              Divider(
                                color: kPrimaryColor,
                              ),
                              InformationField(
                                  onSaved: (value) {
                                    student!.curso = value!;
                                  },
                                  fieldName: "Curso",
                                  information: student!.curso),
                              Divider(
                                color: kPrimaryColor,
                              ),
                              CustomButton(
                                  margin: 80,
                                  onTap: () async {
                                    _form.currentState!.save();
                                    if (hasDataChanged()) {
                                      await updateUserInfo();
                                    } else {
                                      print("Não mudou");
                                    }
                                  },
                                  isLoading: isUpdating,
                                  text: "Atualizar",
                                  textColor: Colors.white,
                                  buttonColor: kPrimaryColor),
                              CustomButton(
                                margin: 80,
                                onTap: () async {
                                  await _auth.signOut();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                isLoading: false,
                                text: 'Logout',
                                textColor: kPrimaryColor,
                                buttonColor: Color.fromARGB(35, 32, 157, 139),
                              )
                            ],
                          ),
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
  const InformationField(
      {required this.fieldName,
      required this.information,
      required this.onSaved});

  final String fieldName;
  final String information;
  final Function(String?)? onSaved;

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
          Expanded(
            flex: 2,
            child: Text(
              widget.fieldName,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextFormField(
              onSaved: widget.onSaved,
              initialValue: widget.information,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.normal),
            ),
          )
        ],
      ),
    );
  }
}
