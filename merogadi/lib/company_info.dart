import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:merogadi/button_widget.dart';
import 'package:merogadi/data_rows.dart';
import 'package:merogadi/iconned_button.dart';

class CompanyInfo extends StatefulWidget {
  const CompanyInfo({Key? key}) : super(key: key);

  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  //List of company's details
  List specificdata = [
    {"text1": "Website", "text2": "www.newarautomobile.com"},
    {"text1": "Location", "text2": "Naxal, kathmandu, Nepal"},
    {"text1": "Opening Time", "text2": "9 a.m to 7 p.m"},
    {"text1": "Contact", "text2": "01-4443339"},
    {"text1": "Type", "text2": "All kind of service"},
    {"text1": "Cost", "text2": "Normal to premium"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEFEBE9),
      appBar: AppBar(
        backgroundColor: const Color(0XFFEFEBE9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            //navigate back to home
            Navigator.pop(context);
          },
        ),
        actions: const [
          Icon(
            CupertinoIcons.arrowshape_turn_up_right,
            color: Colors.green,
            size: 24,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/service.jpg",
                height: 200,
                width: 400,
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Newar automobile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            //row of buttons
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ButtonWidget(buttonText: "OverView"),
                ButtonWidget(buttonText: "Reviews"),
                ButtonWidget(buttonText: "Services"),
              ],
            ),

            //Bottom border
            PreferredSize(
                child: Container(
                  color: Colors.grey,
                  height: 2.0,
                ),
                preferredSize: const Size.fromHeight(2.0)),

            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const IconnedButton(
                      icondataa: Icons.add,
                      texttitle: "Add Review",
                      colors: Colors.black),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const IconnedButton(
                      icondataa: Icons.remove_red_eye_outlined,
                      texttitle: "Follow",
                      colors: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Service center info",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                )),

            //List showing companies info details
            //DataRows(text1: "Website", text2: "www.amazon.com"),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: specificdata.map((e) {
                return buildRows(
                  e['text1'],
                  e['text2'],
                );
              }).toList(),
            ),
            const SizedBox(
              height: 8.0,
            ),
            // const Align(
            //     alignment: Alignment.topLeft,
            //     child: Text(
            //       "Inside",
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontWeight: FontWeight.w700,
            //           fontSize: 24),
            //     )),
          ],
        ),
      )),
    );
  }

  Widget buildRows(text1, text2) {
    return DataRows(text1: text1, text2: text2);
  }
}
