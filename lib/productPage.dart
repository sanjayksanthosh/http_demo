import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_get/productModel.dart';
import 'package:http_get/productcard.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> products = [];

  void getdata() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    //json decode and encode (jsonEncode(body))
    // var data = jsonDecode(response.body);

    // print(data);
    setState(() {
      products = productFromJson(response.body);
    });
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
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            price: products[index].price.toString(),
            imageUrl: products[index].image,
            title: products[index].title,
          );
        },
      ),
    );
  }
}
