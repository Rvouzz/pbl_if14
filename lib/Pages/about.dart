import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color.fromARGB(255, 100, 171, 69),
      ),
      body: const Card(
        child: Column(
          children: [
            ListTile(
              leading: Image(
                  image: AssetImage("assets/images/rio2.jpg"),
                  height: 150,
                  width: 50,
                  fit: BoxFit.fill),
              title: Text(
                  style: TextStyle(fontSize: 18), 'Januar Rio Grace Sitorus'),
              subtitle:
                  Text('Instagram : @jiiooo_reef\nWhatsapp : +6282286844622'),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image(
                  image: AssetImage("assets/images/azriqin.jpg"),
                  height: 150,
                  width: 50,
                  fit: BoxFit.fill),
              title: Text(style: TextStyle(fontSize: 18), 'Mohd.Azriqin'),
              subtitle:
                  Text('Instagram : @qinshibe._\nWhatsapp : +6281371962017'),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image(
                  image: AssetImage("assets/images/raja1.jpg"),
                  height: 150,
                  width: 50,
                  fit: BoxFit.fill),
              title: Text(
                  style: TextStyle(fontSize: 18),
                  'Raja Muhammad Farhan Zahputra'),
              subtitle:
                  Text('Instagram : @raja.farhan\nWhatsapp : +6281371944544'),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image(
                  image: AssetImage("assets/images/febri.jpg"),
                  height: 150,
                  width: 50,
                  fit: BoxFit.fill),
              title: Text(style: TextStyle(fontSize: 18), 'Febriadi Lesmana'),
              subtitle: Text('Instagram : @w.p3bz_\nWhatsapp : +6285375793833'),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
