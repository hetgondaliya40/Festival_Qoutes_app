import 'dart:async';

import 'package:flutter/material.dart';

import '../../routes/routes.dart';

class Spalshscreen extends StatefulWidget {
  const Spalshscreen({super.key});

  @override
  State<Spalshscreen> createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<Spalshscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        context,
        Routes.homepage,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.network(
            "https://play-lh.googleusercontent.com/54ncyt02KS8Ei8XpbyoYqEm1q7zmDZANzH0QqJIXk2ubU5-HsgnwhCJqV9V3G4gc2s8=w240-h480-rw",
          ),
          const Spacer(),
          const LinearProgressIndicator(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
