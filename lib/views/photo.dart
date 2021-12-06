// Code written by Nicholas Rosato
// photo.dart
// Magnifier photo page
// last updated 11/16/2021

import 'package:flutter/material.dart';
import 'package:flutter_app/gallery_manger.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/constants/constants.dart' as constants;

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
          const SizedBox(height: 20),
          ValueListenableBuilder<RequestState>(
            valueListenable: stateManager.resultNotifier,
            builder: (context, requestState, child) {
              if (requestState is RequestLoadInProgress) {
                return const CircularProgressIndicator();
              } else if (requestState is RequestLoadSuccess) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: requestState.img
                  )
                );
              } else if (requestState is RequestImageFromGallery) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: requestState.img
                    )
                  );
              } else {
                // TODO: make this a stock image
                return Container();
              }
            },
          ),
          ElevatedButton(
              onPressed: () => stateManager.makeGetRequest(constants.CF_OPTION_NONE),
              child: const Text("Get Picture From Magnifier")
          ),
          ElevatedButton(
            onPressed: () => stateManager.makeGetRequest(constants.CF_OPTION_BLUE),
            child: const Text ("Get Color Filtered Picture")
          ),
          ElevatedButton(
              onPressed: () => stateManager.showPhotoLibrary(),
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