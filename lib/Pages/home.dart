import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pbl_if14/models/iconic_place.dart';
import 'package:pbl_if14/models/place_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

var menus = [
  FeatherIcons.home,
  FeatherIcons.compass,
  FeatherIcons.edit,
];

var selectedMenu = 0;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF614BC3),
        title: 
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("GUIDE.ME",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon:const  Icon(FeatherIcons.logIn,color: Colors.white,))],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container kedua
              _cardbesar(),

              // Container ketiga
              Container(
                color: const Color(0xFF614BC3),
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),

                // Hanya ada satu child di dalam Container, jadi tidak perlu menggunakan list.
                child: _topplace(),
              ),
              // Container keempat
              _topplaces(),

              // Container kelima
              Container(
                  color: const Color(0xFF614BC3),
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),

                  // Hanya ada satu child di dalam Container, jadi tidak perlu menggunakan list.
                  child: _iconicplacetext()),

              // Container keenam
              _iconicplace()
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: const Color(0xFF3D1FC4),
        type: BottomNavigationBarType.fixed,
        items: menus
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
            .toList(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: const Color(0xFFA193DF),
      );

  

  AspectRatio _cardbesar() {
    return AspectRatio(
      aspectRatio: 360 / 213,
      child: Container(
          // Warna container kedua
          color: const Color.fromARGB(255, 255, 255, 255),

          // Posisi container kedua
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),

          // Child container kedua
          child: Stack(
            children: [
              Image.asset(
                'assets/images/bg1.png',
                height: double.maxFinite,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 140, 232, 0),
                        child: Text(
                          "WELCOME\nEXPLORER",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                        child: Text(
                          "Let's visit the destination at Batam Island",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Padding _topplace() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.award,
              color: Colors.white,
            ),
          ),
          Text(
            'TOP PLACES',
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
}

ListView _topplaces() {
  return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => place(places[index]),
      separatorBuilder: (context, index) => const SizedBox(
            height: 1,
          ),
      itemCount: places.length);
}

Container place(PlaceModel placeModel) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          color: const Color(0xFF000000).withOpacity(.25),
          blurRadius: 4,
          offset: const Offset(0, 4))
    ]),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/${placeModel.image}",
              height: 68,
              width: 68,
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Text(
                    placeModel.name,
                    style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF000000)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RatingBar.builder(
                    initialRating: placeModel.rating,
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
            const SizedBox(
              width: 40,
            ),
            TextButton(
              onPressed: () {
                // Tambahkan kode aksi button di sini
              },
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF33BBC5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(72, 23)),
              child: Text(
                "View",
                style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )
          ],
        ),
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
  return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => iplace(iconicplaces[index]),
      separatorBuilder: (context, index) => const SizedBox(
            height: 1,
          ),
      itemCount: iconicplaces.length);
}

Container iplace(IconicPlaceModel iconicPlaceModel) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          color: const Color(0xFF000000).withOpacity(.25),
          blurRadius: 4,
          offset: const Offset(0, 4))
    ]),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/${iconicPlaceModel.image}",
              height: 68,
              width: 68,
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Text(
                    iconicPlaceModel.name,
                    style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF000000)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RatingBar.builder(
                    initialRating: iconicPlaceModel.rating,
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
            const SizedBox(
              width: 40,
            ),
            TextButton(
              onPressed: () {
                // Tambahkan kode aksi button di sini
              },
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF33BBC5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(72, 23)),
              child: Text(
                "View",
                style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
