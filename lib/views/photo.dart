// Code written by Nicholas Rosato
// photo.dart
// Magnifier photo page
// last updated 11/16/2021

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_app/gallery_manger.dart';
import 'package:flutter_app/constants/constants.dart' as Constants;
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotoPage extends StatelessWidget {
  final stateManager = GalleryManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery View'),
      ),
      body: Column(
          children: <Widget>[
            SizedBox(height: 20),

            ValueListenableBuilder<RequestState>(
              valueListenable: stateManager.resultNotifier,
              builder: (context, requestState, child) {
                if (requestState is RequestLoadInProgress) {
                  return CircularProgressIndicator();
                } else if (requestState is RequestLoadSuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: requestState.img
                    )
                  );
                } else {
                  return Container();
                }
              },
            ),
            ElevatedButton(
                onPressed: () => stateManager.makeGetRequest(),
                child: const Text("Get Picture From Magnifier")
            ),
            ElevatedButton(
                onPressed: () => stateManager.makeGetRequest(),
                child: const Text("Get Picture From Device")
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