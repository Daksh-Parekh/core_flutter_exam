import 'dart:developer';
import 'dart:io';

import 'package:core_flutter_exam/uitils/dlobals.dart';
import 'package:core_flutter_exam/uitils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  List<Map> allDetails = [{}];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: allDetails
                    .map(
                      (e) => Container(
                        height: size.height * 0.6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 80,
                                  foregroundImage: e['image'] != null
                                      ? FileImage(e['image']!)
                                      : null,
                                ),
                                FloatingActionButton.small(
                                  onPressed: () async {
                                    ImagePicker picker = ImagePicker();
                                    XFile? file = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    if (file != null) {
                                      log("Iamge received");
                                      e['image'] = File(file.path);
                                      setState(() {});
                                    } else {
                                      log("Image not received");
                                    }
                                  },
                                  child: Icon(Icons.add),
                                )
                              ],
                            ),
                            10.h,
                            TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                e['id'] = val;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Student ID",
                                labelText: "Enter Student ID",
                              ),
                            ),
                            10.h,
                            TextFormField(
                              onChanged: (val) {
                                e['name'] = val;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Student Name",
                                labelText: "Enter Student Name",
                              ),
                            ),
                            10.h,
                            TextFormField(
                              onChanged: (val) {
                                e['course'] = val;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Student Course",
                                labelText: "Enter Student Course",
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      allDetails.add({});
                      setState(() {});
                    },
                    child: Text(
                      "ADD",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                  10.w,
                  MaterialButton(
                    onPressed: () {
                      Globals.StudentDetail = allDetails;
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
