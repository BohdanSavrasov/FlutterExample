import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CircleClipper extends CustomClipper<Path> {
  final Offset center;
  final double fraction;
  final double minRadius;

  CircleClipper(this.center, this.minRadius, this.fraction);

  @override
  getClip(Size size) {
    final maxW = max(center.dx, size.width - center.dx);
    final maxH = max(center.dy, size.height - center.dy);
    final maxRadius = sqrt(maxW * maxW + maxH * maxH);

    return Path()
      ..addOval(Rect.fromCircle(
        center: center,
        radius: lerpDouble(minRadius, maxRadius, fraction),
      ));
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
