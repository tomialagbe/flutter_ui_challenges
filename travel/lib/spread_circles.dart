import 'package:flutter/material.dart';
import 'package:travel/circles.dart';

class SpreadCircles extends StatefulWidget {

  @override
  State createState() => new SpreadCirclesState();
}

class SpreadCirclesState extends State<SpreadCircles>
    with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> purpleCircleDiameter;
  Animation<double> yellowCircleDiameter;
  Animation<double> greenCircleDiameter;

  @override
  void initState() {
    super.initState();

    animationController =
    new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 800));

    purpleCircleDiameter = new Tween<double>(begin: 0.0, end: 130.0).animate(
        new CurvedAnimation(parent: animationController,
            curve: new Interval(0.0, 0.6, curve: Curves.bounceInOut)));

    yellowCircleDiameter = new Tween<double>(begin: 0.0, end: 80.0).animate(
        new CurvedAnimation(parent: animationController,
            curve: new Interval(0.3, 0.7, curve: Curves.bounceInOut)));

    greenCircleDiameter = new Tween<double>(begin: 0.0, end: 60.0).animate(
        new CurvedAnimation(parent: animationController,
            curve: new Interval(0.6, 1.0, curve: Curves.easeIn)));

    purpleCircleDiameter.addListener(() {
      setState(() {});
    });

    greenCircleDiameter.addListener(() {
      setState(() {});
    });

    yellowCircleDiameter.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.transparent,
      child: new Stack(
        children: <Widget>[
          new Align( // light green circle on the left border
            alignment: new Alignment(-1.0, -0.05),
            child: new Circle(
              color: Colors.grey.withGreen(190).withOpacity(0.5),
              diameter: greenCircleDiameter.value,
              center: new Offset(10.0, 25.0),
            ),
          ),

          new Align( // purple circle on the right border
            alignment: new Alignment(1.0, 0.24),
            child: new Circle(
              color: Colors.purple.withOpacity(0.8),
              diameter: purpleCircleDiameter.value,
              center: new Offset(95.0, 75.0),
            ),
          ),

          new Align( // yellow circle at the top
            alignment: new Alignment(0.6, -0.85),
            child: new Circle(
                color: Colors.yellow.withOpacity(0.8),
                diameter: yellowCircleDiameter.value
            ),
          ),
        ],
      ),
    );
  }
}