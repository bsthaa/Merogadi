import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merogadi/booking_history.dart';

class BikeProfile extends StatefulWidget {
  const BikeProfile({Key? key}) : super(key: key);

  @override
  _BikeProfileState createState() => _BikeProfileState();
}

class _BikeProfileState extends State<BikeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18203d),
      appBar: AppBar(
        title: const Text(
          'Bike Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
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
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff18203d), Color(0xff1a237e)])),
            child: SizedBox(
                width: double.infinity,
                // height: 500.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/images/fz.jpg",
                            width: 400,
                            fit: BoxFit.contain,
                          ),
                          // radius: 60.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "FZS V2",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.black,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 22.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Company",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Yamaha",
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.white38,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Number Plate",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "BA 1234",
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.white38,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Owner",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Bibek Shrestha",
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.white38,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Total Serviced:",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '          04',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100.0,
          ),
          SizedBox(
            width: 300.00,
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookHistory())),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(80.0)),
                // elevation: 0.0,
                // padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.blue, Colors.blue]),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: const Text(
                      "View Servicing History",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
