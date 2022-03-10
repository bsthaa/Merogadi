import 'package:flutter/material.dart';

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
                  '\n\n\n\n\n\n\n\n\n\n\nPhone: 9803*****',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Email: bibek@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Address: Boudha, Kathmandu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )),
          ],
        ));
  }
}
