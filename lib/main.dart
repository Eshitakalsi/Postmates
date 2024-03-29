import 'package:flutter/material.dart';
import './screens/starter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Postmates',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: StarterPage(),
    );
  }
}
