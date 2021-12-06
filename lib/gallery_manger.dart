// Code written by Nicholas Rosato
// gallery_manager.dart
// Handle state control http requests
// last updated 11/18/2021

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter_app/constants/constants.dart' as constants;
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart'; // NOTE: this only works with web
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;


class GalleryManager {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());

  Future<void> makeGetRequest(String cfOption) async {
    resultNotifier.value = RequestLoadInProgress();
    var response = await get(Uri.parse(constants.FLASK_URL + constants.GET_IMAGE + cfOption + "/"));
    _handleResponse(response);
  }

  void _handleResponse(Response response) {
    if (response.statusCode >= 400) {
      resultNotifier.value = RequestLoadFailure();
    } else {
      Image img = Image.memory(response.bodyBytes);
      resultNotifier.value = RequestLoadSuccess(img);
    }
  }


  void showPhotoLibrary() async {
    Image? image;

    if (kIsWeb) {
      image = (await ImagePickerWeb.getImage(outputType: ImageType.widget)) as Image?; // NOTE: this only works with web
    } else {
      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
      image = Image.file(File(file!.path));
    }

    if (image != null) {
      resultNotifier.value = RequestImageFromGallery(image);
    }

    // TODO: if null provide message to user that it could not find the image

  }

}

class RequestState {
  const RequestState();
}

class RequestImageFromGallery extends RequestState {
  const RequestImageFromGallery(this.img);
  final Image img;
}

class RequestInitial extends RequestState {}
class RequestLoadInProgress extends RequestState {}
class RequestLoadSuccess extends RequestState {
  const RequestLoadSuccess(this.img);
  final Image img;
}
class RequestLoadFailure extends RequestState {}

