import 'package:deen_quran/views/auth/Login_screen.dart';
import 'package:deen_quran/views/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFF5E6D3),
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      home: LoginScreen(),
    );
  }
}
