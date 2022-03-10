import 'package:flutter/material.dart';

class TermsCond extends StatefulWidget {
  const TermsCond({Key? key}) : super(key: key);

  @override
  _TermsCondState createState() => _TermsCondState();
}

class _TermsCondState extends State<TermsCond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff18203d),
          title: const Text(
            "Terms and conditions",
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
                  '\n\nMerogadi offers you the comfort of having your vehicle serviced without having to spend time doing so, customer must first create an account on the app by supplying information such as your name, phone number, and email address, as well as a password of your choice. Our Privacy policy will govern the use of the personal information you supply. When you create an account, you affirm that all of the information you supply is accurate and unbiased, and that you will notify us of any changes to the data you submit so that it is current at all periods, our service representative will meet you at the place you specified for the bike pickup during the time period you chose. In the event of an emergency failure, merogadi may select an approved transportation carrier to carry your vehicle to your preferred service center or the nearest service center from the pickup site. Half an hour before the scheduled time slot begins, you should be accessible for a call. At the time of pick-up, you need have the following documents: Valid drivers license and vehicle registration certificate.',
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
