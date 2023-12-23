import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pbl_if14/Pages/detail.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_if14/conn/conn.dart' as conn;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listdata = [];
  bool _isloading = true;
  String koneksi = conn.ip_read_iconic;

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
        backgroundColor: const Color.fromARGB(255, 100, 171, 69),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "GUIDE.ME",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    cardBesar(),
                    Container(
                      color: const Color.fromARGB(255, 100, 171, 69),
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: _iconicplacetext(),
                    ),
                    _iconicplace(),
                  ],
                ),
              ),
            ),
    );
  }

  Container cardBesar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(23, 213, 0, 60),
      width: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "WELCOME\nEXPLORER",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xffffffff),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Let's visit the destination at Batam Island",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xffffffff),
            ),
          )
        ],
      ),
    );
  }

  Padding _iconicplacetext() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.star,
              color: Colors.white,
            ),
          ),
          Text(
            'ICONIC PLACES',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  ListView _iconicplace() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => iplace(index),
      itemCount: _listdata.length,
    );
  }

  Container iplace(int index) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.memory(
                base64Decode(_listdata[index]['destination_image_1']),
                height: 68,
                width: 68,
              ),
              const SizedBox(
                width: 1,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Text(
                        _listdata[index]['destination_name'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              TextButton(
                onPressed: () {
                  // Tambahkan kode aksi button di sini
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(
                        ListData: {
                          "id_destination": _listdata[index]['id_destination'],
                          "destination_name": _listdata[index]
                              ['destination_name'],
                          "destination_description": _listdata[index]
                              ['destination_description'],
                          "destination_operational_hour": _listdata[index]
                              ['destination_operational_hour'],
                          "destination_address": _listdata[index]
                              ['destination_address'],
                          "destination_image_1": _listdata[index]
                              ['destination_image_1'],
                          "destination_image_2": _listdata[index]
                              ['destination_image_2'],
                          "destination_image_3": _listdata[index]
                              ['destination_image_3'],
                          "latitude": _listdata[index]['latitude'],
                          "longitude": _listdata[index]['longitude'],
                        },
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 100, 171, 69),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(72, 23),
                ),
                child: Text(
                  "View",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
