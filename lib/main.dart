import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';
import 'package:unit_mais/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF23209D)),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: kPrimaryColor,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.normal),
            bodyMedium: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
