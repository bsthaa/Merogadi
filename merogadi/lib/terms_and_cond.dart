import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TermsCond extends StatefulWidget {
  const TermsCond({Key? key}) : super(key: key);

  @override
  _TermsCondState createState() => _TermsCondState();
}

class _TermsCondState extends State<TermsCond> {
  bool isReadMore = false;
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
          padding: const EdgeInsets.all(10),
          children: [
            const Text(('Merogadi'),
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            const SizedBox(height: 10),
            buildText(
              '\nMerogadi offers you the comfort of having your vehicle serviced without having to spend time doing so, customer must first create an account on the app by supplying information such as your name, phone number, and email address, as well as a password of your choice. Our Privacy policy will govern the use of the personal information you supply. When you create an account, you affirm that all of the information you supply is accurate and unbiased, and that you will notify us of any changes to the data you submit so that it is current at all periods, our service representative will meet you at the place you specified for the bike pickup during the time period you chose. In the event of an emergency failure, merogadi may select an approved transportation carrier to carry your vehicle to your preferred service center or the nearest service center from the pickup site. Half an hour before the scheduled time slot begins, you should be accessible for a call. At the time of pick-up, you need have the following documents: Valid drivers license and vehicle registration certificate.',
            ),
            const SizedBox(
              height: 24,
            ),
            //Container(alignment: Alignment.centerLeft, child: buildButton()),
          ],
        ));
  }

  // Widget buildButton() => ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
  //         textStyle: const TextStyle(fontSize: 20),
  //       ),
  //       child: Text(isReadMore ? 'Read Less' : 'Read More'),
  //       onPressed: () => setState(() => isReadMore = !isReadMore),
  //     );

  Widget buildText(String text) {
    return ReadMoreText(
      text,
      trimLines: 10,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Read less',
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    );
    // final maxLines = isReadMore ? null : 5;
    // final overflow = isReadMore ? TextOverflow.visible : TextOverflow.ellipsis;
    // return Text(
    //   text,
    //   maxLines: maxLines,
    //   overflow: overflow,
    //   style: const TextStyle(fontSize: 20),
    // );
  }
}
