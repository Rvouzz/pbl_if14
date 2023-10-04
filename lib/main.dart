import 'package:flutter/material.dart';
import 'ui/login.dart';
// import 'Pages/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guide Me : Aplikasi Tour Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, 
      // home: const Home(),
      home: const LoginPage(),
    );
  }
}
