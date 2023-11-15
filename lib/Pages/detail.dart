import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_if14/conn/conn.dart' as conn;

class Detail extends StatefulWidget {
  final Map ListData;
  Detail({Key? key, required this.ListData}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  double rating = 4.5;
  String koneksi = conn.ip_read_place;
  final formKey = GlobalKey<FormState>();
  TextEditingController id_destination = TextEditingController();
  TextEditingController destination_name = TextEditingController();
  TextEditingController destination_description = TextEditingController();
  TextEditingController destination_operational_hour = TextEditingController();
  TextEditingController destination_address = TextEditingController();
  TextEditingController destination_image_1 = TextEditingController();
  TextEditingController destination_image_2 = TextEditingController();
  TextEditingController destination_image_3 = TextEditingController();
  TextEditingController category_name = TextEditingController();
  TextEditingController controller = TextEditingController();

  Future _update() async {
    final response = await http.post(Uri.parse(koneksi), body: {
      "id_destination": id_destination.text,
      "destination_name": destination_name.text,
      "destination_description": destination_description.text,
      "destination_operational_hour": destination_operational_hour.text,
      "destination_address": destination_address.text,
      "destination_image_1": destination_image_1.text,
      "destination_image_2": destination_image_2.text,
      "destination_image_3": destination_image_3.text,
      "category_name": category_name.text,
    });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    id_destination.text = widget.ListData['id_destination'];
    destination_name.text = widget.ListData['destination_name'];
    destination_description.text = widget.ListData['destination_description'];
    destination_operational_hour.text =
        widget.ListData['destination_operational_hour'];
    destination_address.text = widget.ListData['destination_address'];
    destination_image_1.text = widget.ListData['destination_image_1'];
    destination_image_2.text = widget.ListData['destination_image_2'];
    destination_image_3.text = widget.ListData['destination_image_3'];
    category_name.text = widget.ListData['category_name'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 100, 171, 69),
        title: const Row(
          children: [
            Text("Detail",
                style: TextStyle(
                  fontSize: 22,
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

  Container _judul() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
      color: const Color.fromARGB(255, 100, 171, 69),
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
                    destination_name.text,
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffffffff)),
                  ),
                  Text(
                    destination_address.text,
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
                  Text("Open " + destination_operational_hour.text,
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600))
                ],
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
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )),
                    icon: const Icon(
                      FeatherIcons.edit2,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 12,
                    ),
                    label: const Text(
                      "Rate and Review",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255, 255)),
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
            destination_description.text,
            style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 0, 0, 0)),
          )
        ],
      )),
    );
  }
}
