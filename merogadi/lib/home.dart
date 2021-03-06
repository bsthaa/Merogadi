import 'package:flutter/material.dart';
import 'package:merogadi/bike_profile.dart';
import 'package:merogadi/booking_history.dart';
import 'package:merogadi/card_widget.dart';
//import 'package:merogadi/map_utils.dart';
import 'package:merogadi/nav.dart';
import 'package:merogadi/parts_and_acce.dart';
import 'package:merogadi/service_center.dart';
import 'package:merogadi/profile_screen.dart';
import 'package:merogadi/user_booking.dart';

import 'map_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: const Color(0xff18203d),
        title: const Text(
          'Merogadi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            highlightColor: Colors.black,
            iconSize: 33,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xff18203d),

      //screen body
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(18.0, 15, 18.0, 15),
          ),

          SizedBox(
            child: Row(
              children: const [
                Text(
                  "       24 X 7 service provider",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 13.5, 18.0, 13.5),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 371,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: MySearchDelegate(),
                          );
                        },
                        color: Colors.black,
                      ),
                      hintText: "Search...",
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: Container(
                //       width: 60,
                //       color: Colors.white,
                //       child: TextButton(
                //           onPressed: () {},
                //           child: const Icon(
                //             Icons.tune,
                //             size: 35,
                //             color: Colors.black,
                //           ))),
                // )
              ],
            ),
          ),

          SizedBox(
              height: 210,
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserBook())),
                        child: const HomeCards(
                          title: "Booking",
                          background: Color(0xFF80DEEA),
                          icons: Icons.book,
                        ),
                      ),
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BikeProfile())),
                          child: const HomeCards(
                              title: "Bike Profile",
                              background: Color(0xFFB2EBF2),
                              icons: Icons.motorcycle_rounded),
                        )),
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
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Parts())),
                    child: const HomeCards(
                      title: "Repair guide",
                      background: Color(0xFFA5D6A7),
                      icons: Icons.two_wheeler,
                    ),
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
                    onTap: () {
                      MapUtils.openMap(27.71226019953982, 85.3306405718298);
                    },
                    child: const HomeCards(
                      title: "Nearby",
                      background: Color(0xFFFFCCBC),
                      icons: Icons.near_me,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookHistory())),
                    child: const HomeCards(
                        title: "Booking \nHistory",
                        background: Color(0xFFFBE9E7),
                        icons: Icons.history_edu_rounded),
                  ),
                ],
              )),
        ],
      )),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Honda Service Center',
    'Bajan Service Center',
    'Ducati Service Center',
    'Parts and accessories',
    'Tires change',
    'Booking',
    'Booking History',
    'Nearby',
    'Bibek Shrestha',
    'how to change tire',
    'how to change handle bar',
    'handle bar',
    'Oil Change',
    'Dent',
    'Mirror Change',
    'Oil leak',
    'Oil type',
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];
  @override
  Widget buildResults(BuildContext context) =>
      Center(child: Text(query, style: const TextStyle(fontSize: 64)));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            });
      },
    );
  }
}
