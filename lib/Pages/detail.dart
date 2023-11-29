// ignore_for_file: non_constant_identifier_names
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_if14/conn/conn.dart' as conn;
import 'package:pbl_if14/Pages/maps.dart';

class Detail extends StatefulWidget {
  final Map ListData;
  const Detail({Key? key, required this.ListData}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();
  TextEditingController category_name = TextEditingController();

  late GoogleMapController mapController;
  LatLng _center = LatLng(41.89034591813256, 12.49225236311074);
  Marker _marker = Marker(
    markerId: MarkerId('1'),
    position: LatLng(41.89034591813256, 12.49225236311074),
    infoWindow: InfoWindow(
      title: 'Marker Title',
    ),
  );

  double rating = 4.5;

  @override
  void initState() {
    super.initState();
    // Menginisialisasi data dari widget.ListData
    id_destination.text = widget.ListData['id_destination'];
    destination_name.text = widget.ListData['destination_name'];
    destination_description.text = widget.ListData['destination_description'];
    destination_operational_hour.text =
        widget.ListData['destination_operational_hour'];
    destination_address.text = widget.ListData['destination_address'];
    destination_image_1.text = widget.ListData['destination_image_1'];
    destination_image_2.text = widget.ListData['destination_image_2'];
    destination_image_3.text = widget.ListData['destination_image_3'];
    latitude.text = widget.ListData['latitude'];
    longitude.text = widget.ListData['longitude'];
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    // Perbarui peta saat GoogleMapController diinisialisasi
    _update();
  }

  Future _update() async {
    double latitudeDB = double.parse(latitude.text);
    double longitudeDB = double.parse(longitude.text);

    final newMarker = Marker(
      markerId: MarkerId('1'),
      position: LatLng(latitudeDB, longitudeDB),
      infoWindow: InfoWindow(
        title: ' ${destination_name.text}',
      ),
    );

    setState(() {
      _marker = newMarker;
      _center = LatLng(latitudeDB, longitudeDB);
    });

    // Perbarui peta ke posisi baru
    mapController.moveCamera(CameraUpdate.newLatLng(_center));

    // Kirim data ke server atau database
    final response = await http.post(Uri.parse(koneksi), body: {
      "id_destination": id_destination.text,
      "destination_name": destination_name.text,
      "destination_description": destination_description.text,
      "destination_operational_hour": destination_operational_hour.text,
      "destination_address": destination_address.text,
      "destination_image_1": destination_image_1.text,
      "destination_image_2": destination_image_2.text,
      "destination_image_3": destination_image_3.text,
      "latitude": latitudeDB.toString(),
      "longitude": longitudeDB.toString(),
    });

    if (response.statusCode == 200) {
      // Proses berhasil
      print("Data berhasil diperbarui");
    } else {
      // Proses gagal
      print("Gagal memperbarui data");
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
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
            children: [
              _gambarDetail(),
              _judul(),
              _deskripsi(),
              _maps(),
              _descriptionMaps(),
            ],
          ),
        ),
      ),
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
        ),
      ),
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
                      color: const Color(0xffffffff),
                    ),
                  ),
                  Text(
                    destination_address.text,
                    style: GoogleFonts.inter(
                      fontSize: 7,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffffffff),
                    ),
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
                    ),
                  ),
                  Text(
                    "Open ${destination_operational_hour.text}",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                    ),
                  ),
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
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _deskripsi() {
    return Container(
      color: const Color.fromARGB(218, 100, 171, 69),
      padding: const EdgeInsets.fromLTRB(50, 12, 50, 12),
      child: Center(
        child: Column(
          children: [
            Text(
              "History",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
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
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _maps() {
    return SizedBox(
      height: 250,
      child: GestureDetector(
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Maps(
                latitude: double.parse(latitude.text),
                longitude: double.parse(longitude.text),
                destinationName: destination_name.text,
              ),
            ),
          );
        },
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          compassEnabled: false,
          mapToolbarEnabled: false,
          tiltGesturesEnabled: false,
          rotateGesturesEnabled: false,
          scrollGesturesEnabled: false,
          myLocationButtonEnabled: false,
          myLocationEnabled: false,
          indoorViewEnabled: false,
          liteModeEnabled: false,
          trafficEnabled: false,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 13.0,
          ),
          markers: {_marker},
        ),
      ),
    );
  }

  Container _descriptionMaps() {
    return Container(
      color: const Color.fromARGB(255, 100, 171, 69),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: [
                Text(
                  "Map Showing location of ${destination_name.text}",
                  style: GoogleFonts.inter(fontSize: 12, color: Colors.white),
                ),
                Text(
                  "('Double tap to view fullscreen map')",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
