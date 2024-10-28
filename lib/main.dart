// import 'package:aurasecure/screens/auth%20screens/loginScreen.dart';
import 'package:aurasecure/screens/authscreens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aurasecure',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // body:Image.asset('assets/images/signup1-removebg'),
        home: const Loginscreen());
  }
}
