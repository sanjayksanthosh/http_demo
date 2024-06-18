import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          user.isEmpty
              ? Text("list is empty")
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(user[index]["name"]);
                    },
                    itemCount: user.length,
                  ),
                ),
          ElevatedButton(
              onPressed: () {
                getdata();
              },
              child: Text("get data"))
        ],
      ),
    );
  }
}
