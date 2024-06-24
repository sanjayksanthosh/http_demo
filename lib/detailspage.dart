import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  String? title;
  String? age;
  DetailsPage({super.key, this.title, this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(title!),
            Text(age!),
          ],
        ),
      ),
    );
  }
}
