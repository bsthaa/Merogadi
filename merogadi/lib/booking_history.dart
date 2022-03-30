import 'package:flutter/material.dart';

class BookHistory extends StatefulWidget {
  const BookHistory({Key? key}) : super(key: key);

  @override
  _BookHistoryState createState() => _BookHistoryState();
}

class _BookHistoryState extends State<BookHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff18203d),
        title: const Text(
          "Booking History",
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

      //screen body
      body: SingleChildScrollView(child: Column()),
    );
  }
}
