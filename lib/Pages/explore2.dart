import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbl_if14/Pages/detail.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_if14/conn/conn.dart' as conn;

class Explore2 extends StatefulWidget {
  const Explore2({super.key});

  @override
  State<Explore2> createState() => _Explore2State();
}

class _Explore2State extends State<Explore2> {
  List _listdata = [];
  bool _isloading = true;
  String koneksi = conn.ip_read;
  Future _getdata() async {
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
    _getdata();
    print(_listdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded)),
          title: const Text("Find Destination", style: TextStyle(fontSize: 22)),
          backgroundColor: const Color.fromARGB(255, 100, 171, 69),
        ),
        body: _isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _listdata.length,
                itemBuilder: ((context, index) {
                  return SafeArea(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Color(0xffffffff)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(19, 48, 19, 13),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("assets/images/vio-vio.jpg"),
                              fit: BoxFit.cover,
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 2.25),
                                  constraints: const BoxConstraints(
                                    maxWidth: 150,
                                    minHeight: 30,
                                  ),
                                  child: Text(
                                    _listdata[index]['destination_name'],
                                    style: const TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2125,
                                        color: Color(0xffffffff)),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(1, 5, 0, 0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color.fromARGB(255, 100, 171, 69),
                                          minimumSize: const Size(47, 18),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Detail()));
                                      },
                                      child: const Text("View")),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
