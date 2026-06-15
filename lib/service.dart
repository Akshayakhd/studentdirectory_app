import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> add_student(
  String name,
  String rollnumber,
  String course,
  BuildContext context,
) async {
  try {
    await FirebaseFirestore.instance.collection("datas").add({
      "Name ": name,
      "Roll Number": rollnumber,
      "course": course,
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Student Added Succcesfully!!")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Stream<QuerySnapshot> get_students() {
  return FirebaseFirestore.instance.collection("datas").snapshots();
}

Future<void> delete_student(String id, BuildContext context) async {
  try {
    await FirebaseFirestore.instance.collection("datas").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Student data Removed Successfully")),
    );
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> update_student(
  String name,
  String id,
  String rollnumber,
  String course,
  BuildContext context,
) async {
  try {
    await FirebaseFirestore.instance.collection("datas").doc(id).update   ({
      "Name ": name,
      "Roll Number": rollnumber,
      "course": course,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Student Details Updated Succcesfully!!")),
    );
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
