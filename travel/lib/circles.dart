import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Circle extends StatelessWidget {

  final Color color;
  final double diameter;
  final Offset center;

  Circle({@required this.color, @required this.diameter, this.center});

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      size: new Size(diameter, diameter),
      painter: new CirclePainter(color, center: center),
    );
  }

}

class CirclePainter extends CustomPainter {

  final Color color;
  final Offset center;

  CirclePainter(this.color, {this.center});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        center ?? new Offset(size.width / 2, size.height / 2), size.width / 2,
        new Paint()..color = this.color);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;

}