import 'package:flutter/material.dart';
import 'package:pbl_if14/Pages/explore.dart';
import 'package:pbl_if14/Pages/home.dart';
// import 'package:pbl_if14/ui/landingpage.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'ui/login.dart';


void main() {
  runApp(const MyApp());
}

var pages = [
  const Home(),
  const ExplorePage(),
  // const LandingPage()
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guide Me : Aplikasi Tour Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[selectedMenu], // Menampilkan halaman yang sesuai
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  var menus = [
  FeatherIcons.home,
  FeatherIcons.compass,
  FeatherIcons.edit,
];

var selectedMenu = 0;

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: const Color(0xFF3D1FC4),
        type: BottomNavigationBarType.fixed,
        items: menus
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
            .toList(),
        currentIndex: selectedMenu, // Menentukan indeks yang dipilih
        onTap: (index) {
          setState(() {
            selectedMenu = index; // Mengubah indeks yang dipilih
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: const Color.fromARGB(255, 12, 12, 12),
      );
}