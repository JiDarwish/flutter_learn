import 'package:flutter/material.dart';
import '../models/ImageModel.dart';

class ImageList extends StatelessWidget {
  List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        children: <Widget>[
          Image.network(image.url),
          Padding(padding: EdgeInsets.only(bottom: 10.0)),
          Text(image.title),
        ],
      ),
    );
  }
}
