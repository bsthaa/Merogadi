import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff18203d),
          title: const Text(
            "About us",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          centerTitle: true,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              //navigate back to home
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: const Color(0xff18203d),
        body: ListView(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  '\n\nMerogadi is a service management system project that assists motorcycle owners withservice, motorbike wash, and booking service through well-known workshops with skilledmechanic heads and hospitality via an android mobile application with just a tap of a screen.Below is a list of the positive effects on users. Consumers can use the app to locate servicefacilities, obtain directions, and explore and select services offered at these locations.Orders may be picked up and returned, service appointments booked, test drives taken, andproduct purchases made at the dealer. In the motorbike service sector, the motorbike repairmanagement system is a significant advancement. This app used by any rider can locateand interact with nearby service center. All automobile owners have access to the suggestedsystem. The purpose of this project is to make motorbike maintenance more efficient than itis now, efficiency and quality are critical in the motorcycle repair industry. Machine and equipment planning helping decrease service downtime.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )),
          ],
        ));
  }
}
