import 'package:flutter/material.dart';
import 'package:http/http.dart' show get, Response;
import 'dart:convert' show json;

import 'models/ImageModel.dart';
import 'widgets/ImageList.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void handlePress() async {
    setState(() => ++counter);
    Response data =
        await get('https://jsonplaceholder.typicode.com/photos/${counter}');

    ImageModel imageModel = ImageModel.fromJson(json.decode(data.body));
    setState(() => images.add(imageModel));

    print(imageModel);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to pics'),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: handlePress,
        ),
      ),
    );
  }
}

void main() => runApp(App());
