import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF614BC3),
        title: const Row(
          children: [
            Text("Detail",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ))
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [_gambarDetail(), _judul(), _deskripsi()],
        ),
      )),
    );
  }

  Container _gambarDetail() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
      width: double.maxFinite,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/Detail.jpg'),
        fit: BoxFit.cover,
      )),
    );
  }
}

Container _judul() {
  return Container(
    padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
    color: const Color(0xFF614BC3),
    height: 160,
    child: Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lorem Ipsum",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffffffff)),
                ),
                Text(
                  "Jl. Engku Putri No.1, Belian, Kec. Batam Kota, Kota Batam, Kepulauan Riau 29461",
                  style: GoogleFonts.inter(
                      fontSize: 7,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffffffff)),
                ),
                const SizedBox(
                  height: 5,
                ),
                RatingBar.builder(
                  initialRating: 4.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20.0,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 1,
        ),
        Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FeatherIcons.clock,
                      size: 15,
                      color: Colors.white,
                    )),
                Text("Open",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600))
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
              child: Text(
                "Closed at 22.00 P.M",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
              child: TextButton.icon(
                  onPressed: () {
                    // tambahkan kode aksi disini
                  },
                  style: TextButton.styleFrom(
                      fixedSize: const Size(100, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(
                          color: Color(0xFF33BBC5),
                        ),
                      )),
                  icon: const Icon(
                    FeatherIcons.edit2,
                    color: Color(0xFF33BBC5),
                    size: 12,
                  ),
                  label: const Text(
                    "Rate and Review",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF33BBC5)),
                  )),
            )
          ],
        ),
      ],
    ),
  );
}

Container _deskripsi() {
  return Container(
    color: const Color.fromARGB(255, 255, 255, 255),
    height: 300,
    padding: const EdgeInsets.fromLTRB(50, 12, 50, 12),
    child: Center(
        child: Column(
      children: [
        Text(
          "History",
          style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF614BC3)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          textAlign: TextAlign.justify,
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF614BC3)),
        )
      ],
    )),
  );
}
