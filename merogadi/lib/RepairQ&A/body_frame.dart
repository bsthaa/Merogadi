import 'package:flutter/material.dart';
import 'package:merogadi/RepairQ&A/QuestionsAns/frame_rep.dart';
import 'package:merogadi/RepairQ&A/QuestionsAns/handle_bar.dart';

class BodyFrame extends StatefulWidget {
  const BodyFrame({Key? key}) : super(key: key);

  @override
  _BodyFrameState createState() => _BodyFrameState();
}

class _BodyFrameState extends State<BodyFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff18203d),
          title: const Text(
            "Body and Frame",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          centerTitle: true,
          elevation: 1,
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
        body: Center(
            child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFE0F7FA),
            ),
            width: 400,
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Tips for motorcycle frame repair',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FrameRep())),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFE0F7FA),
            ),
            width: 400,
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'How to install handlebar',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HandleBar())),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFE0F7FA),
            ),
            width: 400,
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'How to install handle bar risers',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFE0F7FA),
            ),
            width: 400,
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'How to install replace mirror',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFE0F7FA),
            ),
            width: 400,
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'How to install grips on handebar',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFE0F7FA),
            ),
            width: 400,
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'How to install swingarm extension',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ])));
  }
}
