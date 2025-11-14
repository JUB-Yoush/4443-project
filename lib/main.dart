import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login.dart';
import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget firstPage = LoginPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: getLoginPrefs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return snapshot.data == true ? HomePage() : LoginPage();
          }
        },
      ),
    );
  }

  Future<bool> getLoginPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_logged_in') ?? false;
  }
}
