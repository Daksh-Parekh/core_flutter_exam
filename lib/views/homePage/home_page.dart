import 'package:core_flutter_exam/routes/app_routes.dart';
import 'package:core_flutter_exam/uitils/dlobals.dart';
import 'package:core_flutter_exam/uitils/extension.dart';
import 'package:core_flutter_exam/views/detailPage/detailPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text(
          "HomePage",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(
              Icons.refresh,
              size: 38,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: Globals.StudentDetail.map(
            (e) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.detailPage);
              },
              child: Container(
                height: size.height * 0.16,
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.cyan.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    foregroundImage: FileImage(e['image']),
                  ),
                  title: Text(
                    "${e['id']}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "${e['name']}\t\t\t${e['course']}",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          scrollable: true,
                          backgroundColor: Colors.cyan.shade50,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Student Details"),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                icon: Icon(Icons.close_rounded),
                              ),
                            ],
                          ),
                          actions: [
                            TextFormField(
                              initialValue: e['id'],
                              onChanged: (value) {
                                e['id'] = value;
                              },
                              decoration: InputDecoration(
                                labelText: "Id",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            10.h,
                            TextFormField(
                              initialValue: e['name'],
                              onChanged: (value) {
                                e['name'] = value;
                              },
                              decoration: InputDecoration(
                                labelText: "Name",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            10.h,
                            TextFormField(
                              initialValue: e['course'],
                              onChanged: (value) {
                                e['course'] = value;
                              },
                              decoration: InputDecoration(
                                labelText: "course",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            10.h,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MaterialButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    Globals.StudentDetail.remove(e);
                                    setState(
                                      () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    Globals.StudentDetail = e['id'];
                                    Globals.StudentDetail = e['name'];
                                    Globals.StudentDetail = e['course'];
                                  },
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                ),
              ),
            ),
          ).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.detailPage);
        },
        backgroundColor: Colors.cyanAccent,
        icon: Icon(Icons.add),
        label: Text(
          "Add Student",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
