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
  List<Map<String, dynamic>> allDetails = [{}];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 26,
          ),
        ),
        title: Text(
          "Detail Page",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
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
                        height: size.height * 0.54,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent.withAlpha(50),
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
                                  backgroundColor: Colors.indigo.shade500,
                                  foregroundImage: e['image'] != null
                                      ? FileImage(e['image']!)
                                      : null,
                                ),
                                FloatingActionButton.small(
                                  backgroundColor: Colors.white,
                                  splashColor: Colors.cyan,
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
                                  child: const Icon(
                                    Icons.add_a_photo_rounded,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                            10.h,
                            TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                e['id'] = val;
                              },
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.indigo.shade400,
                  ),
                  10.w,
                  MaterialButton(
                    onPressed: () {
                      Globals.StudentDetail = allDetails;
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.indigo.shade400,
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
