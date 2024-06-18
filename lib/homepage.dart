import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List user = [];

  void getdata() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body);
    print(data);
    setState(() {
      user = data;
    });
  }

  // @override
  // void initState() {
  //   getdata();

  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          user.isEmpty ? Text("there is no data") : Text(user[2]["name"]),
          ElevatedButton(
              onPressed: () {
                getdata();
              },
              child: Text("get data"))
        ],
      ),
    ));
  }
}
