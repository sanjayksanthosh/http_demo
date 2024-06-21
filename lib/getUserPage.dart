import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserPage extends StatefulWidget {
  const GetUserPage({super.key});

  @override
  State<GetUserPage> createState() => _GetUserPageState();
}

class _GetUserPageState extends State<GetUserPage> {
  String getName = '';

  void getuser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = await prefs.getString('name');
    String? age = await prefs.getString('age');
    print("$name $age");
    setState(() {
      getName = name!;
    });
  }

  @override
  void initState() {
    getuser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(getName)),
    );
  }
}
