import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:telescopium/animated_screen.dart';
import 'package:telescopium/Animated_star.dart';

//import 'package:tflite/tflite.dart';

Future<void> main() async{
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telescopium',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: const Color(0xFFbccff9),

        brightness: Brightness.light,
        accentColor: const Color(0xFF7582a2),
        fontFamily: 'openSans',
        //primarySwatch: Colors.blue,
      ),
      home: Animatedstar(),
    );
  }
}
