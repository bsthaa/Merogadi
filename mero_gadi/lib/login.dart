// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Image.asset("assets/images/splashscreen.png");
    return Scaffold(
        appBar: AppBar(title: const Text('Signup')),
        body: Center(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: "Enter your name"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: "Enter your phone number"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: "Enter your email id"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: "Enter password"),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child:
                        Text("Signup", style: TextStyle(color: Colors.white)),
                    color: Colors.green,
                  )
                ],
              )),
        ));
  }
}
