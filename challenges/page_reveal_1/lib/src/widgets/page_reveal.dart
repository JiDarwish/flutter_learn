import 'package:flutter/material.dart';
import 'dart:math';

class PageReveal extends StatelessWidget {
  final double revealPercent;
  final Widget child;

  const PageReveal({Key key, this.revealPercent, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: child,
      clipper: CircleRevealClipper(revealPercent),
    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect> {
  final double revealPercent;

  CircleRevealClipper(this.revealPercent);

  @override
  Rect getClip(Size size) {
    final epiCenter = new Offset(size.width / 2, size.height * 0.9);
    final distanceToCorner = sqrt(pow(epiCenter.dx, 2) + pow(epiCenter.dy, 2));

    // Used during animating shit
    final radius = distanceToCorner * revealPercent;
    final diameter = 2 * radius;

    return Rect.fromLTWH(
        epiCenter.dx - radius, epiCenter.dy - radius, diameter, diameter);
  }

  shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
