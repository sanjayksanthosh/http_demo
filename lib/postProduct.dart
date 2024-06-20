import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_get/productModel.dart';
import 'package:http_get/productcard.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // List<Product> products = [];
  List data = [];

  void getdata() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    //json decode and encode (jsonEncode(body))
    // var data = jsonDecode(response.body);

    // print(data);
    setState(() {
      data = jsonDecode(response.body);
      //   products = productFromJson(response.body);
    });
  }

  void postData() async {
    try {
      var response = await http.post(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          headers: {'content-type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "userId": 4,
            "title": "test post",
            "body": "this is a test post"
          }));
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          postData();
        },
        child: Text("send data"),
      ),
    )
        // ListView.builder(
        //   itemCount: data.length,
        //   itemBuilder: (context, index) {
        //     return Text(data[index]["title"]);
        //   },
        // ),
        );
  }
}
