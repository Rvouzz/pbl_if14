// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbl_if14/Pages/detail.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Explore2 extends StatefulWidget {
  Explore2({super.key, required this.categoryId});
  String categoryId;

  @override
  State<Explore2> createState() => _Explore2State();
}

class _Explore2State extends State<Explore2> {
  List _listdata = [];
  bool _isloading = true;
  Future _getdata() async {
    try {
      int categoryIdInt = int.tryParse(widget.categoryId) ?? 0;

      final response = await http.get(Uri.parse(
          'https://exploreperjalanan.com/des/pblif14/koneksi_flutter/read_destinations.php?id_category=$categoryIdInt'));
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
          title: const Text("Find Destination",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
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
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(19, 48, 19, 13),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: MemoryImage(base64Decode(
                                  _listdata[index]['destination_image_1'])),
                              fit: BoxFit.cover,
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                        backgroundColor: const Color.fromARGB(
                                            255, 100, 171, 69),
                                        minimumSize: const Size(47, 18),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)))),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Detail(
                                            ListData: {
                                              "id_destination": _listdata[index]
                                                  ['id_destination'],
                                              "destination_name":
                                                  _listdata[index]
                                                      ['destination_name'],
                                              "destination_description":
                                                  _listdata[index][
                                                      'destination_description'],
                                              "destination_operational_hour":
                                                  _listdata[index][
                                                      'destination_operational_hour'],
                                              "destination_address":
                                                  _listdata[index]
                                                      ['destination_address'],
                                              "destination_image_1":
                                                  _listdata[index]
                                                      ['destination_image_1'],
                                              "destination_image_2":
                                                  _listdata[index]
                                                      ['destination_image_2'],
                                              "destination_image_3":
                                                  _listdata[index]
                                                      ['destination_image_3'],
                                              "latitude": _listdata[index]
                                                  ['latitude'],
                                              "longitude": _listdata[index]
                                                  ['longitude'],
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "View",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
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
