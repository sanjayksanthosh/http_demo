import 'package:flutter/material.dart';
import 'package:http_get/getUserPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});

  @override
  State<Adduser> createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();

  void adduser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('age', ageController.text);
  }

  void getuser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = await prefs.getString('name');
    String? age = await prefs.getString('age');
    print("$name $age");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextField(
          controller: nameController,
        ),
        TextField(
          controller: ageController,
        ),
        ElevatedButton(
            onPressed: () {
              adduser();
            },
            child: Text("add user")),
        ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) {
              //     return GetUserPage();
              //   },
              // ));
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return GetUserPage();
                },
              ));
            },
            child: Text("nextpage")),
      ],
    ));
  }
}
