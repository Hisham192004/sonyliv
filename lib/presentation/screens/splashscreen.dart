import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sonyliv/presentation/screens/home_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 4),(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>const Homescreen()),
      );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          image:AssetImage('assets/sonyliv.png')),
      ),
    );
  }
}