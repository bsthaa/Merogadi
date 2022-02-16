import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:merogadi/userdata/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child:
                    Image.asset("assets/images/man.jpg", fit: BoxFit.contain),
              ),
              // Text(
              //   "User details",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              SizedBox(
                height: 30,
              ),
              Text(
                "User name:",
                style: TextStyle(
                    //backgroundColor: Colors.blue,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
              Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                "Email:",
                style: TextStyle(
                    //backgroundColor: Colors.blue,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text(
                    "Logout",
                    style: TextStyle(
                        //backgroundColor: Colors.blue,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
