import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff18203d),
          title: const Text(
            "Contact us",
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
                  'Address: Boudha, Kathmandu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  child: const Text('Make Phone Call'),
                  onPressed: () async {
                    const phoneNumber = '+977-9803836536';
                    const url = 'tel:$phoneNumber';

                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                )),
            Container(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  child: const Text('Send an Email'),
                  onPressed: () async {
                    const toEmail = 'bibekshrestha242@gmail.com';
                    const subject = 'Big Fan';
                    const message = 'Hello Bibek!\n\nI am your big fan';
                    final url =
                        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                )),
          ],
        ));
  }
}
