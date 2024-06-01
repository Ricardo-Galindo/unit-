import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';
import 'package:unit_mais/firebase_options.dart';
import 'package:unit_mais/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const HomePage(),
    );
  }
}
