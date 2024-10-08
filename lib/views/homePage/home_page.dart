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
        title: Text("HomePage"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: Globals.StudentDetail.map(
            (e) => GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Update "),
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
                    ],
                  ),
                );
              },
              child: Container(
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: Container(
                    height: size.height * 0.23,
                    width: size.width * 0.23,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(e['image']),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  title: Text("${e['id']}  ${e['name']}"),
                  subtitle: Text(e['course']),
                  trailing: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.update_rounded),
                      ),
                      IconButton(
                        onPressed: () {
                          Globals.StudentDetail.remove(e);
                        },
                        icon: Icon(Icons.delete_forever),
                      ),
                    ],
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
        icon: Icon(Icons.add),
        label: Text("Add Student"),
      ),
    );
  }
}
