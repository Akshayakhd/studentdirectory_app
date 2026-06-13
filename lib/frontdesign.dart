import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:studentdirectory_app/studentdirectory_home.dart';

class Frontdesign extends StatelessWidget {
  const Frontdesign({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentdirectoryHome()),
      ); //one page to other connection
    });
    return Scaffold(
      body: Column(
        children: [
          Center(child: Lottie.asset("assets/stud2.json")),
          Text(
            "student Directory App",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
