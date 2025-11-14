import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Money App")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: NetworkImage("https://placecats.com/100/100")),
              Column(
                children: [
                  Text("good morning jimmithy"),
                  Text("let's check your progress"),
                ],
              ),
              IconButton(
                onPressed: () {
                  print("object");
                },
                icon: const Icon(Icons.notification_add),
              ),
              Column(children: []),
            ],
          ),
        ],
      ),
    );
  }
}
