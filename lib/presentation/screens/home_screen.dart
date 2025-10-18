import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    // appBar: ,
    body: Column(
      children: [
        Text('This is the home page')
      ],
    ),);
  }
}