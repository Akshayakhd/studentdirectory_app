import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentdirectory_app/service.dart';

class StudentdirectoryHome extends StatefulWidget {
  @override
  State<StudentdirectoryHome> createState() => _StudentdirectoryHomeState();
}

class _StudentdirectoryHomeState extends State<StudentdirectoryHome> {
  TextEditingController name = TextEditingController();

  TextEditingController roll = TextEditingController();

  TextEditingController course = TextEditingController();

  void edit_box(DocumentSnapshot doc) {
    name.text = doc["Name "];
    roll.text = doc["Roll Number"];
    course.text = doc["course"];
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 130, 149, 181),
      context: context,
      builder: (context) {
        return Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Update Student Details",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 13),
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: "Student Name ",
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: roll,
              decoration: InputDecoration(
                labelText: "Roll Number",
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: course,
              decoration: InputDecoration(
                labelText: "Course Name ",
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  {
                    update_student(
                      name.text,
                      doc.id,
                      roll.text,
                      course.text,
                      context,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(400, 60),
                  backgroundColor: const Color.fromARGB(255, 87, 160, 195),
                  foregroundColor: Colors.white,
                ),
                child: Text("update"),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: get_students(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("No Data"));
          }
          final data = snapshot.data!.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                //widget used for showing data on screen
                title: Text(
                  data[index]["Name "],
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ), //inside semicolon give the same given in firebase to store data
                subtitle: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .start,
                  children: [
                    Text(
                      data[index]["Roll Number"],
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data[index]["course"],
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: .min,
                  children: [
                    IconButton(
                      onPressed: () {
                        edit_box(data[index]);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        delete_student(data[index].id, context);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 175, 190, 213),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Student directory",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 96, 129, 179),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Student"),
                content: Column(
                  mainAxisSize: .min,
                  children: [
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "Student Name ",
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: roll,
                      decoration: InputDecoration(
                        labelText: "Roll Number",
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: course,
                      decoration: InputDecoration(
                        labelText: "Course Name ",
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          {
                            add_student(
                              name.text,
                              roll.text,
                              course.text,
                              context,
                            );
                            name.clear();
                            roll.clear();
                            course.clear();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 60),
                          backgroundColor: const Color.fromARGB(
                            255,
                            87,
                            160,
                            195,
                          ),
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Add"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ); //pop dialoguebox
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 71, 106, 149),
      ),
    );
  }
}
