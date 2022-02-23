import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:merogadi/card_widget.dart';
import 'package:merogadi/service_center.dart';
import 'package:merogadi/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18203d),

      //screen body
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu_outlined,
                  size: 48,
                  color: Colors.white,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreen()),
                          );
                        },
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        )
                        // child: Image.asset(
                        //   "assets/images/man.png",
                        //   height: 40,
                        //   width: 40,
                        //   fit: BoxFit.cover,
                        // )
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
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
          ),
          const Text(
            "Bike stop",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 13.5, 18.0, 13.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 50,
                  width: 305,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: "Search...",
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
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.tune,
                            size: 35,
                            color: Colors.black,
                          ))),
                )
              ],
            ),
          ),

          SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const HomeCards(
                        title: "General service",
                        background: Color(0xFF80DEEA),
                        icons: Icons.miscellaneous_services,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const HomeCards(
                        title: "Repair",
                        background: Color(0xFFB2EBF2),
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
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ServiceCenterList())),
                    child: const HomeCards(
                      title: "Service center",
                      background: Color(0xFFB2DFDB),
                      icons: Icons.store_mall_directory,
                    ),
                  ),
                  const HomeCards(
                    title: "Parts and accessories",
                    background: Color(0xFFA5D6A7),
                    icons: Icons.two_wheeler,
                  ),
                ],
              )),
          SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: const HomeCards(
                      title: "Nearby",
                      background: Color(0xFFFFCCBC),
                      icons: Icons.near_me,
                    ),
                  ),
                  const HomeCards(
                    title: "Booking",
                    background: Color(0xFFFBE9E7),
                    icons: Icons.book,
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
