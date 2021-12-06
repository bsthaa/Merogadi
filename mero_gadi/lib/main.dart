// ignore_for_file: unnecessary_new
import 'package:flutter/material.dart';
import './login.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false, title: 'MeroGadi', home: new MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xFF000000),
        body: SizedBox(
          width: 2220,
          height: 1080,
          child: Image.asset('assets/images/splashscreen.png'),
        ));
  }
}
