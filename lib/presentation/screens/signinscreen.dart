import 'package:flutter/material.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Sign in to watch",style:TextStyle(fontSize: 20) ,),centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        
      ),
    );
  }
}