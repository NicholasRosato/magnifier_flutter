// Code written by Nicholas Rosato
// route.dart
// navigation controller
// last updated 11/16/2021

import 'package:flutter/material.dart';
import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/views/photo.dart';

// variable for the route names
const String photoPage = 'photo';
const String homePage = 'home';

void login() {}

// controller function with switch statement to control page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case photoPage:
      return MaterialPageRoute(builder: (context) => const PhotoPage());
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    default:
      throw ('this route name does not exist');
  }
}
