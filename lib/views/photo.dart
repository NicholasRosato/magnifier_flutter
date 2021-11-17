// Code written by Nicholas Rosato
// photo.dart
// Magnifier photo page
// last updated 11/16/2021

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // code for the login page layout
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery View'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: PhotoView(
                  imageProvider: const AssetImage("assets/magnifier_stock_img.png")
              )
            ),
          ),
          ElevatedButton(
            child: const Text("Return"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}