import 'package:flutter/material.dart';
import 'package:merogadi/service_center_info.dart';

class ServiceCenterList extends StatefulWidget {
  const ServiceCenterList({Key? key}) : super(key: key);

  @override
  _ServiceCenterListState createState() => _ServiceCenterListState();
}

class _ServiceCenterListState extends State<ServiceCenterList> {
  @override
  Widget build(BuildContext context) {
    //list of the cards data
    final Size size = MediaQuery.of(context).size;
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
      {
        "title": "Shuvam servicicng",
        "imageUrl": "assets/images/man04.png",
        "rating": "4.1",
        "location": "Jorpati,Kathmandu",
        "description":
            "All company motorbike services available with expirience technisian."
      },
      {
        "title": "Honda automobile",
        "imageUrl": "assets/images/man03.png",
        "rating": "3.9",
        "location": "Chabahil,Kathmandu",
        "description":
            "All company motorbike services available with expirience technisian."
      },
      {
        "title": "Addi service center",
        "imageUrl": "assets/images/man05.png",
        "rating": "3.8",
        "location": "Naxal,Kathmandu",
        "description":
            "All company motorbike services available with expirience technisian."
      },
      {
        "title": "Bibek automobile",
        "imageUrl": "assets/images/man03.png",
        "rating": "2.6",
        "location": "Naxal,Kathmandu",
        "description":
            "All company motorbike services available with expirience technisian."
      },
      {
        "title": "Honda automobile",
        "imageUrl": "assets/images/man01.jpg",
        "rating": "1.7",
        "location": "Naxal,Kathmandu",
        "description":
            "All company motorbike services available with expirience technisian."
      },
    ];

    return Scaffold(
      //color of the entire screen
      backgroundColor: const Color(0XFFEFEBE9),

      //app's appBar
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
            Icons.search,
            color: Colors.black,
            size: 48,
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
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Service Center",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    FlatButton(
                        onPressed: () {},
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Colors.blueGrey)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          children: const [
                            Text(
                              "Filter",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Icon(
                              Icons.tune,
                              size: 24,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ],
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
        child: Container(
          height: 100,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServiceCenterInfo()));
            },
            child: Card(
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
