import 'package:flutter/material.dart';

class NewHotScreen extends StatefulWidget {
  const NewHotScreen({super.key});

  @override
  State<NewHotScreen> createState() => _NewHotScreenState();
}

class _NewHotScreenState extends State<NewHotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("New & Hot"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
    );
  }
}