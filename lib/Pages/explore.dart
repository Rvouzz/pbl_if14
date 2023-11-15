// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pbl_if14/Pages/explore2.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_if14/conn/conn.dart' as conn;

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List _listdata = [];
  bool _isloading = true;
  String koneksi = conn.ip_read_category;

  Future<void> _getdata() async {
    try {
      final response = await http.get(Uri.parse(koneksi));
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
          _isloading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Destination", style: TextStyle(fontSize: 22)),
        backgroundColor: const Color.fromARGB(255, 100, 171, 69),
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                width: double.infinity,
                decoration: BoxDecoration(color: const Color(0xffffffff)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(17, 12, 17, 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffc4c4c4)),
                          color: const Color(0xfff3f1f1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 107, 6),
                            width: double.infinity,
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    FeatherIcons.compass,
                                    color:
                                        const Color.fromARGB(255, 100, 171, 69),
                                  ),
                                ),
                                Text(
                                  "Explore",
                                  style: GoogleFonts.inter(
                                    color:
                                        const Color.fromARGB(255, 100, 171, 69),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                            child: const Text(
                              "Find a place you like that you want to go",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 100, 171, 69),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _listdata.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(19, 48, 19, 18),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    _listdata[index]['category_image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(5, 0, 0, 2.25),
                                  constraints:
                                      const BoxConstraints(maxWidth: 97),
                                  child: Text(
                                    _listdata[index]['category_name'],
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2125,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(1, 5, 0, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 100, 171, 69),
                                      minimumSize: const Size(47, 18),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Explore2()),
                                      );
                                    },
                                    child: const Text("View"),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
