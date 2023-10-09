// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pbl_if14/PAges/explore2.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      appBar: AppBar(
        title: Text("Find Destination"),
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
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 107, 6),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 7, 0.49),
                            width: 19,
                            height: 18,
                            child: Image(
                              image: AssetImage("assets/images/icons.png"),
                              width: 19,
                              height: 18,
                            ),
                          ),
                          Text(
                            "Explore",
                            style: GoogleFonts.inter(
                                color: Color(0xff614bc3),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                height: 1.2125),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                      child: Text(
                        "Find a place you like that you want to go",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 1.2125,
                            color: Color(0xff614bc3)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(19, 48, 19, 18),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/beach.jpg"),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 2.25),
                      constraints: BoxConstraints(maxWidth: 97),
                      child: Text(
                        "Beach",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            height: 1.2125,
                            color: Color(0xffffffff)),
                      ),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Explore2()));
                          },
                          child: Text("View")),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(19, 48, 19, 18),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/shopping.jpg"),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 2.25),
                      constraints: BoxConstraints(maxWidth: 97),
                      child: Text(
                        "Shopping\nPlace",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            height: 1.2125,
                            color: Color(0xffffffff)),
                      ),
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
              Container(
                padding: EdgeInsets.fromLTRB(19, 48, 19, 18),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/amusement_park.jpg"),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 2.25),
                      constraints: BoxConstraints(maxWidth: 99),
                      child: Text(
                        "Amusement\nPark",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            height: 1.2125,
                            color: Color(0xffffffff)),
                      ),
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
              Container(
                padding: EdgeInsets.fromLTRB(19, 48, 19, 18),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/wtb.jpg"),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 2.25),
                      constraints: BoxConstraints(maxWidth: 99),
                      child: Text(
                        "Historical\nPlace",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            height: 1.2125,
                            color: Color(0xffffffff)),
                      ),
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
