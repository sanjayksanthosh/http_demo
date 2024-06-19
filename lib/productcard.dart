import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  String? imageUrl;
  String? title;
  String? price;
  ProductCard({super.key, this.imageUrl, this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      height: 200,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(imageUrl!),
          Text(title!),
          Text(price!),
        ],
      ),
    );
  }
}
