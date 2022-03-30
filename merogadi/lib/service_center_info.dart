import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:merogadi/button_widget.dart';
import 'package:merogadi/data_rows.dart';
import 'package:merogadi/iconned_button.dart';
import 'package:share_plus/share_plus.dart';

class ServiceCenterInfo extends StatefulWidget {
  const ServiceCenterInfo({Key? key}) : super(key: key);

  @override
  _ServiceCenterInfoState createState() => _ServiceCenterInfoState();
}

class _ServiceCenterInfoState extends State<ServiceCenterInfo> {
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
      backgroundColor: const Color(0xff18203d),
      appBar: AppBar(
        backgroundColor: const Color(0xff18203d),
        elevation: 4,
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              CupertinoIcons.arrowshape_turn_up_right,
            ),
            highlightColor: Colors.white,
            iconSize: 33,
            onPressed: () async {
              const weburl =
                  'https://www.google.com/search?q=service%20center&oq=&aqs=chrome.5.69i59i450l8.401148j0j1&sourceid=chrome&ie=UTF-8&tbs=lf:1,lf_ui:14&tbm=lcl&rflfq=1&num=10&rldimm=13660862572278729970&lqi=Cg5zZXJ2aWNlIGNlbnRlckiAsMP2-a-AgAhaIBAAEAEYABgBIg5zZXJ2aWNlIGNlbnRlcioGCAMQABABkgEIbWVjaGFuaWOqARYQASoSIg5zZXJ2aWNlIGNlbnRlcigA&ved=2ahUKEwjp7rzn8-32AhXSilwKHX88CzoQvS56BAgFEAE&rlst=f#rlfi=hd:;si:13660862572278729970,l,Cg5zZXJ2aWNlIGNlbnRlckiAsMP2-a-AgAhaIBAAEAEYABgBIg5zZXJ2aWNlIGNlbnRlcioGCAMQABABkgEIbWVjaGFuaWOqARYQASoSIg5zZXJ2aWNlIGNlbnRlcigA;mv:[[27.7361176,85.3757736],[27.6412992,85.2956466]]';

              await Share.share('Service Center\n $weburl');
            },
          ),
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: const IconnedButton(
                    icondataa: Icons.add,
                    texttitle: "Add Review",
                    colors: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 145.0,
                  height: 50.0,
                  child: ElevatedButton.icon(
                    label: const Text(
                      "Favourite",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    icon: const Icon(
                      Icons.favorite_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Sucessfully Added to Favourite");
                    },
                  ),
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
                      color: Colors.white,
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
