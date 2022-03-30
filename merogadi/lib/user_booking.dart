//import 'package:date_field/date_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class UserBook extends StatefulWidget {
  const UserBook({Key? key}) : super(key: key);

  @override
  State<UserBook> createState() => _UserBookState();
}

class _UserBookState extends State<UserBook> {
  final format = DateFormat("yyyy-MM-dd");
  final controllerName = TextEditingController();
  final controllerModel = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerDropIn = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff18203d),
        title: const Text(
          "Booking service",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
        ),
        centerTitle: true,
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
      body: ListView(padding: const EdgeInsets.all(25), children: <Widget>[
        // const SizedBox(height: 10),
        const Text(
          'Name',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextField(
          controller: controllerName,
          decoration: const InputDecoration(
            fillColor: Color(0xFFEEEEEE),
            filled: true,
            border: OutlineInputBorder(),
            hintText: 'Enter Your Full Name',
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
        TextField(
          controller: controllerModel,
          decoration: const InputDecoration(
            fillColor: Color(0xFFEEEEEE),
            filled: true,
            border: OutlineInputBorder(),
            hintText: 'Enter your Bike Model',
          ),
          //keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24),
        const Text(
          'Phone Number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextField(
          controller: controllerPhone,
          decoration: const InputDecoration(
            fillColor: Color(0xFFEEEEEE),
            filled: true,
            border: OutlineInputBorder(),
            hintText: 'Enter your Phone Number',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24),
        const Text(
          'Address',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextField(
          controller: controllerAddress,
          decoration: const InputDecoration(
            fillColor: Color(0xFFEEEEEE),
            filled: true,
            border: OutlineInputBorder(),
            hintText: 'Enter your Address',
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Date',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        DateTimeField(
          controller: controllerDate,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            fillColor: Color(0xFFEEEEEE),
            filled: true,
            //border: OutlineInputBorder(),
            hintText: 'Date You Want To Service',
          ),
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
              context: context,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              initialDate: currentValue ?? DateTime.now(),
            );
          },
        ),
        const SizedBox(height: 24),
        const Text(
          'Drop In / Drop Off',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextField(
          controller: controllerDropIn,
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(),
            hintText: 'Use Drop In / Drop Off ? Type Yes or No',
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: 50.0,
          height: 50.0,
          child: ElevatedButton(
            child: const Text(
              'Book',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              final user = User(
                name: controllerName.text,
                model: controllerModel.text,
                phone: int.parse(controllerPhone.text),
                address: controllerAddress.text,
                date: DateTime.parse(controllerDate.text),
                dropIn: controllerDropIn.text,
              );
              createUser(user);
              Fluttertoast.showToast(msg: "Bike Service Booked Sucessfully.");
              Navigator.pop(context);
            },
          ),
        ),
      ]));
  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );
  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('booking').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final String model;
  final int phone;
  final String address;
  final DateTime date;
  final String dropIn;

  User({
    this.id = '',
    required this.name,
    required this.model,
    required this.phone,
    required this.address,
    required this.date,
    required this.dropIn,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'model': model,
        'phone': phone,
        'address': address,
        'date': date,
        'dropIn': dropIn,
      };
}
