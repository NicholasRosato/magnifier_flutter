// Code written by Nicholas Rosato
// home.dart
// Magnifier home page
// last updated 11/16/2021

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:flutter_app/route/route.dart' as route;
import 'package:flutter_app/constants/constants.dart' as Constants;

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isRunning = useState(true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnifier'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Mjpeg(
                isLive: isRunning.value,
                error: (context, error, stack) {
                  print(error);
                  print(stack);
                  return Text(error.toString(), style: const TextStyle(color: Colors.red));
                },
                stream: Constants.STREAM_URL,
              ),
            ),
          ),
          ElevatedButton(
              child: const Text("Go to gallery view"),
              onPressed: () => Navigator.pushNamed(context, route.photoPage),
          ),
        ],
      ),
    );
  }
}