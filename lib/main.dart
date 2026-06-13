import 'package:flutter/material.dart';
import 'package:studentdirectory_app/frontdesign.dart';
import 'package:studentdirectory_app/studentdirectory_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Frontdesign()));
}
