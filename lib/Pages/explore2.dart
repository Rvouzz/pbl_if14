// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Explore2 extends StatefulWidget {
  const Explore2({super.key});

  @override
  State<Explore2> createState() => _Explore2State();
}

class _Explore2State extends State<Explore2> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded)),
        title: Text("Find Destination", style: TextStyle(fontSize: 22)),
        backgroundColor: Color.fromARGB(255, 109, 54, 236),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(17, 12, 17, 16),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc4c4c4)),
                    color: Color(0xfff3f1f1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.compass,
                            color: Color(0xff614bc3),
                          ),
                        ),
                        Text(
                          "Beach",
                          style: GoogleFonts.inter(
                              color: Color(0xff614bc3),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.2125),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                      child: Text(
                        "Find which beach you like that you want to go",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff614bc3)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(19, 48, 19, 13),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/vio-vio.jpg"),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 2.25),
                      constraints: BoxConstraints(maxWidth: 97),
                      child: Text(
                        'Vio vio Beach,\nGalang Island',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.2125,
                            color: Color(0xffffffff)),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          iconSize: 15,
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.mapPin,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 0),
                        Text(
                          "20 km",
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(1, 5, 0, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff33bbc5),
                              minimumSize: Size(47, 18),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {},
                          child: Text("View")),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
