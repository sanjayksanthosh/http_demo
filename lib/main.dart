import 'package:flutter/material.dart';
import 'package:http_get/getType.dart';
import 'package:http_get/homepage.dart';
import 'package:http_get/list_page.dart';
import 'package:http_get/postProduct.dart';
import 'package:http_get/sharedpref_page.dart';
// import 'package:http_get/productPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProductPage());
  }
}
