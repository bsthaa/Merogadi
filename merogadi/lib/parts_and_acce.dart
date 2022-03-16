import 'package:flutter/material.dart';
import 'package:merogadi/RepairQ&A/body_frame.dart';
import 'package:merogadi/RepairQ&A/fuel_air.dart';
import 'package:merogadi/parts_card.dart';

class Parts extends StatefulWidget {
  const Parts({Key? key}) : super(key: key);

  @override
  _PartsState createState() => _PartsState();
}

class _PartsState extends State<Parts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff18203d),
        title: const Text(
          "Repair guide",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
        ),
        centerTitle: true,
        elevation: 0,
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

      //screen body
      body: SingleChildScrollView(
          child: Column(
        children: [
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
                              builder: (context) => const BodyFrame())),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const PartsCard(
                          title: "Body and Frame",
                          background: Color(0xFFE0F7FA),
                          icons: Icons.miscellaneous_services,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FuelAir())),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const PartsCard(
                            title: "Fuel and Air",
                            background: Color(0xFFE0F7FA),
                            icons: Icons.build_circle,
                          ),
                        )),
                  ])),
          SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push,
                    child: const PartsCard(
                      title: "Control and Brakes",
                      background: Color(0xFFE0F7FA),
                      icons: Icons.store_mall_directory,
                    ),
                  ),
                  const PartsCard(
                    title: "Electrical",
                    background: Color(0xFFE0F7FA),
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
                    child: const PartsCard(
                      title: "Wheels and Drives",
                      background: Color(0xFFE0F7FA),
                      icons: Icons.near_me,
                    ),
                  ),
                  const PartsCard(
                    title: "Engine and Exhaust",
                    background: Color(0xFFE0F7FA),
                    icons: Icons.book,
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
                    child: const PartsCard(
                      title: "Cooling and Heating",
                      background: Color(0xFFE0F7FA),
                      icons: Icons.near_me,
                    ),
                  ),
                  const PartsCard(
                    title: "Suspension",
                    background: Color(0xFFE0F7FA),
                    icons: Icons.book,
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
                    child: const PartsCard(
                      title: "Paint and Scratches",
                      background: Color(0xFFE0F7FA),
                      icons: Icons.near_me,
                    ),
                  ),
                  const PartsCard(
                    title: "Motrbike Products",
                    background: Color(0xFFE0F7FA),
                    icons: Icons.book,
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
