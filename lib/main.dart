import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:phone_auth/Constants/Constants.dart';
import 'package:phone_auth/Screens/page_home.dart';

import 'package:phone_auth/Screens/page_login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
          backgroundColor: Constant.buttonColor,
        ))),
        home: const HomePage());
  }
}
