import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:merogadi/card_widget.dart';
import 'package:merogadi/service_center.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),

      //screen body
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu_outlined,
                  size: 48,
                  color: Colors.black,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/profile.png",
                      height: 50,
                      width: 48,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
          ),

          // SizedBox(
          //   width: 150,
          //   child: Row(
          //     children: [
          //       Image.asset(
          //         "assets/images/logo.png",
          //         height: 70,
          //         width: 64,
          //         fit: BoxFit.fill,
          //       ),
          //       const SizedBox(
          //         width: 4.0,
          //       ),
          //       // const Text(
          //       //   "Milao",
          //       //   style: TextStyle(
          //       //     color: Colors.black,
          //       //     fontWeight: FontWeight.w700,
          //       //     fontSize: 30,
          //       //   ),
          //       // )
          //     ],
          //   ),
          // ),

          const Text(
            "Your one and only",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22),
          ),
          const Text(
            "Bike stop",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "Search motorbike products and features..",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: 60,
                      color: Colors.white,
                      child: FlatButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.tune,
                            size: 40,
                            color: Colors.black,
                          ))),
                )
              ],
            ),
          ),

          SizedBox(
              height: 170,
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const HomeCards(
                        title: "General service",
                        background: Color(0xFF86AFAE),
                        icons: Icons.miscellaneous_services,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const HomeCards(
                        title: "Repair",
                        background: Color(0xFFDCEDC8),
                        icons: Icons.build_circle,
                      ),
                    )
                  ])),
          // const Padding(
          //   padding: EdgeInsets.fromLTRB(16.0, 4.0, 0.0, 4.0),
          //   child: Align(
          //     alignment: Alignment.topLeft,
          //     child: Text(
          //       "Best of List",
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.w500,
          //           fontSize: 24),
          //     ),
          //   ),
          // ),

          SizedBox(
              height: 170,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceCenterList())),
                    child: const HomeCards(
                      title: "Service center",
                      background: Color(0xFFFBE9E7),
                      icons: Icons.store_mall_directory,
                    ),
                  ),
                  const HomeCards(
                    title: "Parts and accessories",
                    background: Color(0xFFE0F2F1),
                    icons: Icons.two_wheeler,
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
