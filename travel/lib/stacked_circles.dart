import 'package:flutter/material.dart';
import 'package:travel/circles.dart';

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
            child: new Circle(color: Colors.purple, diameter: circleDiameter),
          ),
          new Align(
            alignment: new Alignment(0.5, 0.0),
            child: new Opacity(
              opacity: 0.8,
              child: new Circle(color: Colors.yellow, diameter: circleDiameter),
            ),
          ),
        ],
      ),
    );
  }
}