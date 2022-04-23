//import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:merogadi/bike_prof.dart';
import 'package:merogadi/userdata/user_model.dart';

class BikeProfile extends StatefulWidget {
  const BikeProfile({Key? key}) : super(key: key);

  @override
  _BikeProfileState createState() => _BikeProfileState();
}

class _BikeProfileState extends State<BikeProfile> {
  File? pickedImage;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: const Color(0xff18203d),
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic your bike image from",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

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
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ClipOval(
                    //   child: Image.asset(
                    //     "assets/images/fz.jpg",
                    //     width: 400,
                    //     fit: BoxFit.contain,
                    //   ),
                    //   // radius: 60.0,
                    // ),

                    pickedImage != null
                        ? Image.file(
                            pickedImage!,
                            width: 350,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/bikeUpl.png',
                            height: 200,
                            width: 300,
                            fit: BoxFit.contain,
                          ),

                    Positioned(
                      child: IconButton(
                        onPressed: imagePickerOption,
                        icon: const Icon(
                          Icons.camera_outlined,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      "-----",
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
                                    "-----",
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
                                    "-----",
                                    style: TextStyle(
                                      fontSize: 21.0,
                                      color: Colors.white38,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Owner",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                      "${loggedInUser.firstName} ${loggedInUser.secondName}",
                                      style: const TextStyle(
                                        color: Colors.white38,
                                        fontSize: 21.0,
                                        //fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    TextButton(
                        child: const Text('Fill up the bike info!',
                            style: TextStyle(
                              color: Color(0xff1565C0),
                              fontSize: 15.0,
                            )),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const UserBike())))
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
                  "Next Service:",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '    1500 KM',
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
        ],
      ),
    );
  }

  Widget buildBike(Bike bike) {
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
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ClipOval(
                    //   child: Image.asset(
                    //     "assets/images/fz.jpg",
                    //     width: 400,
                    //     fit: BoxFit.contain,
                    //   ),
                    //   // radius: 60.0,
                    // ),

                    pickedImage != null
                        ? Image.file(
                            pickedImage!,
                            width: 350,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/bikeUpl.png',
                            height: 200,
                            width: 300,
                            fit: BoxFit.contain,
                          ),

                    Positioned(
                      child: IconButton(
                        onPressed: imagePickerOption,
                        icon: const Icon(
                          Icons.camera_outlined,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      "-----",
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
                                children: [
                                  const Text(
                                    "Company",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    bike.company,
                                    semanticsLabel: "-----",
                                    style: const TextStyle(
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
                                    "-----",
                                    style: TextStyle(
                                      fontSize: 21.0,
                                      color: Colors.white38,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Owner",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                      "${loggedInUser.firstName} ${loggedInUser.secondName}",
                                      style: const TextStyle(
                                        color: Colors.white38,
                                        fontSize: 21.0,
                                        //fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    TextButton(
                        child: const Text('Fill up the bike info!',
                            style: TextStyle(
                              color: Color(0xff1565C0),
                              fontSize: 15.0,
                            )),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const UserBike())))
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
                  "Next Service:",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '    1500 KM',
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
        ],
      ),
    );
  }

  Stream<List<Bike>> readBike() => FirebaseFirestore.instance
      .collection('bike')
      .snapshots()
      .map((snapshots) =>
          snapshots.docs.map((doc) => Bike.fromJson(doc.data())).toList());
}

class Bike {
  static Bike fromJson(Map<String, dynamic> json) => Bike(
        company: json['company'],
        model: json['model'],
        plate: json['plate'],
      );
  final String company;
  final String model;
  final int plate;

  Bike({
    required this.company,
    required this.model,
    required this.plate,
  });
  Map<String, dynamic> toJson() => {
        'company': company,
        'model': model,
        'plate': plate,
      };
}
