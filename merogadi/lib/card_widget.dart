import 'package:flutter/material.dart';

class HomeCards extends StatelessWidget {
  //card properties
  final IconData? icons;
  final String title;
  final Color background;

  //final VoidCallback onPressed;

  const HomeCards({
    Key? key,
    required this.icons,
    required this.title,
    required this.background,
    //required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    icons,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
