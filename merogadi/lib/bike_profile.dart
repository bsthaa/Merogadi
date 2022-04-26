//import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:merogadi/bike_prof.dart';
import 'package:merogadi/userdata/user_model.dart';

class BikeProfile extends StatefulWidget {
  const BikeProfile({Key? key}) : super(key: key);

  @override
  _BikeProfileState createState() => _BikeProfileState();
}

class _BikeProfileState extends State<BikeProfile> {
  File? _image;
  File? pickedImage;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final imagePicker = ImagePicker();

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

  Future pickImage() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    // if (_image == null) return;
    // final imageTemporary = File(_image.path);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No image selected", const Duration(milliseconds: 600));
      }
    });
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future uploadFile(File _image) async {
    final bikeID = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref =
        FirebaseStorage.instance.ref().child("profile").child("Bike$bikeID");
    await ref.putFile(_image);
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
                    pickedImage != null
                        ? Image.file(
                            pickedImage!,
                            width: 400,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : GestureDetector(
                            child: _image != null
                                ? GestureDetector(
                                    onTap: () => showPopUpMenu(),
                                    child: Image.file(_image!,
                                        width: 350,
                                        height: 200,
                                        fit: BoxFit.cover))
                                : GestureDetector(
                                    child: Image.asset(
                                      'assets/images/bikeUpl.png',
                                      height: 160,
                                      width: 160,
                                    ),
                                    onTap: () => showPopUpMenu(),
                                  ),
                          ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Bike Model : _____",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 100.0,
                      child: ElevatedButton(
                        onPressed: (() {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const Center());
                          uploadFile(_image!);
                        }),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Row(
                          children: const [
                            Text(
                              "    Upload",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
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
                                    // "${Mybike.firstName} ",
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

  showPopUpMenu() {
    showMenu(
        color: Colors.blue,
        context: context,
        position: const RelativeRect.fromLTRB(100, 200, 100, 200),
        items: [
          PopupMenuItem(
            child: const Text(
              "Select image",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            onTap: () => pickImage(),
            value: 1,
          ),
        ]);
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
