import 'package:flutter/material.dart';

class StackedCircles extends StatelessWidget {

  final double circleDiameter;

  StackedCircles(this.circleDiameter);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: circleDiameter * 2,
      height: circleDiameter,
      child: new Stack(
        children: <Widget>[
          new Align(
            alignment: new Alignment(-0.5, 0.0),
            child: new Circle(Colors.purple, circleDiameter),
          ),
          new Align(
            alignment: new Alignment(0.5, 0.0),
            child: new Opacity(
                opacity: 0.8,
                child: new Circle(Colors.yellow, circleDiameter),
            ),
          ),
        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {

  final Color color;
  final double diameter;

  Circle(this.color, this.diameter);

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      size: new Size(diameter, diameter),
      painter: new CirclePainter(color),
    );
  }

}

class CirclePainter extends CustomPainter {

  final Color color;

  CirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        new Offset(size.width / 2, size.height / 2), size.width / 2,
        new Paint()..color = this.color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}