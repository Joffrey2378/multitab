import 'package:flutter/material.dart';

import 'landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightGreen[200],
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}
