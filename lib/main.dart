import 'package:flutter/material.dart';
import 'package:flutter_jwt_auth/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JWT Authentication',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
