// Code written by Nicholas Rosato
// photo.dart
// Magnifier photo page
// last updated 11/16/2021

import 'package:flutter/material.dart';
import 'package:flutter_app/gallery_manger.dart';
import 'package:flutter/widgets.dart';

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
                } else {
                  return Container();
                }
              },
            ),
            ElevatedButton(
                onPressed: () => stateManager.makeGetRequest(),
                child: const Text("Get Picture")
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