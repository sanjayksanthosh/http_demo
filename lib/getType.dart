import 'dart:convert';

// import 'package:api_productmodel/productModel.dart';
// import 'package:api_productmodel/productcard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_get/detailspage.dart';
import 'package:http_get/productcard.dart';

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
              .get(Uri.parse("https://node-server-ymb5.onrender.com/items"));
      setState(() {
        // products = productFromJson(response.body);
        data = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }

    //json decode and encode (jsonEncode(body))
    // var data = jsonDecode(response.body);
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
              itemCount: data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return DetailsPage(
                          title: data[index]["name"],
                          age: "20",
                        );
                      },
                    ));
                  },
                  child: ProductCard(
                    price: "23",
                    imageUrl:
                        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    title: data[index]["name"],
                  ),
                );
                // return Text(data[index]["name"]);
              },
            ),
    );
  }
}
