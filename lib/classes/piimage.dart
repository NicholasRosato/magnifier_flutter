// Code written by Nicholas Rosato
// piimage.dart
// class for an image from http request on Pi
// last updated 11/17/2021

class PiImage {
  final String image;

  PiImage({
    required this.image,
  });

  factory PiImage.fromJson(Map<String, dynamic> json) {
    return PiImage(
      image: json['image'],
    );
  }
}