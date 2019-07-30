import 'package:flutter/material.dart';
import 'screens/LoginStateful.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: LoginStateful(),
        appBar: AppBar(title: Text('Login')),
      ),
    );
  }
}
