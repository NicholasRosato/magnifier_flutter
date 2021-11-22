// Code written by Nicholas Rosato
// gallery_manager.dart
// Handle state control http requests
// last updated 11/18/2021

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter_app/constants/constants.dart' as Constants;
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class GalleryManager {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());

  Future<void> makeGetRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final response = await get(Uri.parse(Constants.FLASK_URL + Constants.GET_IMAGE));
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
}

class RequestState {
  const RequestState();
}
class RequestInitial extends RequestState {}
class RequestLoadInProgress extends RequestState {}
class RequestLoadSuccess extends RequestState {
  const RequestLoadSuccess(this.img);
  final Image img;
}
class RequestLoadFailure extends RequestState {}

