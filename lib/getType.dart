import 'dart:convert';

// import 'package:api_productmodel/productModel.dart';
// import 'package:api_productmodel/productcard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // List<Product> products = [];
  var data = [];
  void getdata() async {
    try {
      var response =
          //await http.get(Uri.parse("https://fakestoreapi.com/products"));//
          await http
              .get(Uri.parse("https://node-server-c486.onrender.com/items"));
    } catch (e) {
      print(e);
    }

    //json decode and encode (jsonEncode(body))
    // var data = jsonDecode(response.body);

    // setState(() {
    //   // products = productFromJson(response.body);
    //   data = jsonDecode(response.body);
    // });
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
      body: data.isEmpty
          ? CircularProgressIndicator()
          : ListView.builder(
              //itemCount: products.length,
              itemCount: 2,
              itemBuilder: (context, index) {
                // return ProductCard(
                //   price: products[index].price.toString(),
                //   imageUrl: products[index].image,
                //   title: products[index].title,
                // );
                return Text(data[index]["name"]);
              },
            ),
    );
  }
}
