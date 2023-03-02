import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8084167);
    path.quadraticBezierTo(size.width * 0.1949917, size.height * 0.7963000,
        size.width * 0.4030583, size.height * 0.8608667);
    path.cubicTo(
        size.width * 0.6390083,
        size.height * 0.9514333,
        size.width * 0.8316000,
        size.height * 0.9458667,
        size.width,
        size.height * 0.8431000);
    path.quadraticBezierTo(size.width * 0.9999958, size.height * 0.6309417,
        size.width * 0.9999833, size.height * -0.0055333);
    path.lineTo(size.width * -0.0000167, size.height * -0.0055333);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
