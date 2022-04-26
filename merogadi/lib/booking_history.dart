//import 'package:date_field/date_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class BookHistory extends StatefulWidget {
  const BookHistory({Key? key}) : super(key: key);

  @override
  State<BookHistory> createState() => _BookHistoryState();
}

class _BookHistoryState extends State<BookHistory> {
  // final format = DateFormat("yyyy-MM-dd");
  // final controllerName = TextEditingController();
  // final controllerModel = TextEditingController();
  // final controllerPhone = TextEditingController();
  // final controllerAddress = TextEditingController();
  // final controllerDate = TextEditingController();
  // final controllerDropIn = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff18203d),
          title: const Text(
            "Booking History",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
          ),
          centerTitle: true,
          elevation: 4,
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.clear_all,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () async {
                  // show the confirm dialog
                  await showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: const Text(
                                'Are you sure want to clear booking history?'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('No')),
                              TextButton(
                                  onPressed: () async {
                                    final instance = FirebaseFirestore.instance;
                                    final batch = instance.batch();
                                    var collection =
                                        instance.collection('booking');
                                    var snapshots = await collection.get();
                                    for (var doc in snapshots.docs) {
                                      batch.delete(doc.reference);
                                    }
                                    await batch.commit();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Yes'))
                            ],
                          ));
                })
          ],
          // ElevatedButton(
          //     child: const Text('Clear History'),
          //     onPressed: () {
          //       final docUser = FirebaseFirestore.instance
          //           .collection('booking')
          //           .doc('name');
          //       docUser.delete();
          //     }
          //     ),
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
        body: StreamBuilder<List<Book>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Wrong! ${snapshot.error}');
              } else if (snapshot.hasData) {
                final users = snapshot.data!;

                return ListView(
                  children: users.map(buildUser).toList(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
        backgroundColor: const Color(0xff18203d),
      );
  Widget buildUser(Book user) => ListTile(
        leading: CircleAvatar(
          radius: 30,
          // child: Text('${user.date}'),
          child: Text(
            user.model,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ),
        title: Text(
          user.address,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
        ),
        subtitle: Text(
          user.date.toIso8601String(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      );

  Stream<List<Book>> readUsers() => FirebaseFirestore.instance
      .collection('booking')
      .snapshots()
      .map((snapshots) =>
          snapshots.docs.map((doc) => Book.fromJson(doc.data())).toList());

  // Future createUser(User user) async {
  //   final docUser = FirebaseFirestore.instance.collection('booking').doc();
  //   user.id = docUser.id;
  //   final json = user.toJson();
  //   await docUser.set(json);
  // }
}

class Book {
  static Book fromJson(Map<String, dynamic> json) => Book(
        id: json['id'],
        name: json['name'],
        model: json['model'],
        phone: json['phone'],
        address: json['address'],
        date: (json['date'] as Timestamp).toDate(),
        dropIn: json['dropIn'],
      );
  String id;
  final String name;
  final String model;
  final int phone;
  final String address;
  final DateTime date;
  final String dropIn;

  Book({
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
