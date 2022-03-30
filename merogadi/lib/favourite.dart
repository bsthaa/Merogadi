// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:merogadi/service_center_info.dart';

class FavCenter extends StatefulWidget {
  const FavCenter({Key? key}) : super(key: key);

  @override
  _FavCenterState createState() => _FavCenterState();
}

class _FavCenterState extends State<FavCenter> {
  @override
  Widget build(BuildContext context) {
    //list of the cards data
    List companydata = [
      {
        "title": "Newar automobile",
        "imageUrl": "assets/images/man.jpg",
        "rating": "4.8",
        "location": "Naxal,Kathmandu",
        "description":
            "All company motorbike services available with expirience technisian."
      },
      {
        "title": "Bajaj auto shop",
        "imageUrl": "assets/images/man01.jpg",
        "rating": "4.3",
        "location": "Haddigaun,Kathmandu",
        "description":
            "All company motorbike services available with expirience technisian."
      },
    ];

    return Scaffold(
      //color of the entire screen
      backgroundColor: const Color(0xff18203d),

      //app's appBar
      appBar: AppBar(
        backgroundColor: const Color(0xff18203d),
        title: const Text("Favourite"),
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
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          )
        ],
      ),

      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
            child: Column(
              children: [
                Row(
                  //add padding,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: companydata.map((e) {
                    return buildCard(
                      e['title'],
                      e['imageUrl'],
                      e['rating'],
                      e['location'],
                      e['services'],
                    );
                  }).toList(),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildCard(title, imageurl, rating, location, services) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 100,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ServiceCenterInfo()));
            },
            child: Card(
              color: const Color(0xFFE0F7FA),
              elevation: 0.2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset(imageurl, height: 80, width: 80),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1D1B1D)),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(
                            Icons.star_rate_outlined,
                            size: 20,
                            color: Colors.orangeAccent,
                          )),
                          TextSpan(
                            text: rating,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                          ),
                        ])),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.location_on,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                                TextSpan(
                                  text: location,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ]),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.two_wheeler,
                                    size: 20,
                                    color: Colors.green,
                                  ),
                                ),
                                TextSpan(
                                  text: services,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ]),
                            ),
                            const SizedBox(
                              width: 50.0,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    size: 25,
                                    color: Colors.red,
                                  ),
                                ),
                                TextSpan(
                                  text: services,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
