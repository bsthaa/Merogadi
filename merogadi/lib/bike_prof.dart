//import 'package:date_field/date_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class UserBike extends StatefulWidget {
  const UserBike({Key? key}) : super(key: key);

  @override
  State<UserBike> createState() => _UserBikeState();
}

class _UserBikeState extends State<UserBike> {
  final _formkey = GlobalKey<FormState>();

  final controllerCompany = TextEditingController();
  final controllerModel = TextEditingController();
  final controllerPlate = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff18203d),
        title: const Text(
          "Bike Information",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
        ),
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
      backgroundColor: const Color(0xff18203d),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: <Widget>[
          Form(
            key: _formkey,
            child: Column(children: [
              // const SizedBox(height: 10),
              const Text(
                'Bike Company',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              TextFormField(
                controller: controllerCompany,
                decoration: const InputDecoration(
                  fillColor: Color(0xFFEEEEEE),
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'Enter Bike Company',
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Bike Model',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextFormField(
                controller: controllerModel,
                decoration: const InputDecoration(
                  fillColor: Color(0xFFEEEEEE),
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Bike Model',
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Number Plate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextFormField(
                controller: controllerPlate,
                decoration: const InputDecoration(
                  fillColor: Color(0xFFEEEEEE),
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'Enter Bike Number Plate',
                ),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 32),
              SizedBox(
                width: 250.0,
                height: 50.0,
                child: ElevatedButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      final bike = Bike(
                        company: controllerCompany.text,
                        model: controllerModel.text,
                        plate: int.parse(controllerPlate.text),
                      );
                      createBike(bike);
                    } else {
                      const Text(
                        "Please fill the form first",
                      );
                    }

                    Fluttertoast.showToast(msg: "Sucessfully filled the form.");
                    Navigator.pop(context);
                  },
                ),
              ),
            ]),
          )
        ],
      ));
  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );
  Future createBike(Bike bike) async {
    final docBike = FirebaseFirestore.instance.collection('bike').doc();
    final json = bike.toJson();
    await docBike.set(json);
  }
}

class Bike {
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
