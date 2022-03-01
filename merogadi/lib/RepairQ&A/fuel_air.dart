import 'package:flutter/material.dart';
import 'package:merogadi/RepairQ&A/QuestionsAns/fuelair.dart';

class FuelAir extends StatefulWidget {
  const FuelAir({Key? key}) : super(key: key);

  @override
  _FuelAirState createState() => _FuelAirState();
}

class _FuelAirState extends State<FuelAir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff18203d),
          title: const Text(
            "Fuel and Air",
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
                'How to replace a carburetor',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Fuel())),
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
                'How to rebuild carburetor',
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
                'How to clean fuel tank',
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
                'How to repair leaky fuel tank',
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
                'How to replace carburetor',
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
