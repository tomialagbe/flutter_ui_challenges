import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel/animated_text.dart';

enum AnimationType {
  Character,
  SlideDown
}

class AnimatedLocationsText extends StatefulWidget {

  final int delayInMilliseconds;

  AnimatedLocationsText(this.delayInMilliseconds);

  @override
  State createState() => new _AnimationState();
}

class _AnimationState extends State<AnimatedLocationsText>
    with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<Alignment> londonSlideOut;
  Animation<double> londonFadeOut;

  Animation<Alignment> newYorkSlideIn;
  Animation<double> newYorkFadeIn;
  Animation<Alignment> newYorkSlideOut;
  Animation<double> newYorkFadeOut;

  Animation<Alignment> losAngelesSlideIn;
  Animation<double> losAngelesFadeIn;

  String firstLocation = "London";
  String secondLocation = "New York";
  String thirdLocation = "Los Angeles";

  @override
  void initState() {
    super.initState();

    animationController =
    new AnimationController(vsync: this, duration: new Duration(seconds: 6));

    londonSlideOut = new AlignmentTween(
        begin: new Alignment(-1.0, 0.0), end: new Alignment(-1.0, 1.0))
        .animate(new CurvedAnimation(parent: animationController,
        curve: new Interval(0.4, 0.45, curve: Curves.easeIn)));
    londonFadeOut = new Tween<double>(begin: 1.0, end: 0.0)
        .animate(new CurvedAnimation(parent: animationController,
        curve: new Interval(0.42, 0.45, curve: Curves.easeIn)));

    newYorkSlideIn = new AlignmentTween(
      begin: new Alignment(-1.0, -1.0), end: new Alignment(-1.0, 0.0),
    ).animate(new CurvedAnimation(parent: animationController,
        curve: new Interval(0.42, 0.45, curve: Curves.easeIn)));
    newYorkFadeIn = new Tween<double>(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animationController,
        curve: new Interval(0.42, 0.45)));

    newYorkSlideOut = new AlignmentTween(
        begin: new Alignment(-1.0, 0.0), end: new Alignment(-1.0, 1.0))
        .animate(new CurvedAnimation(parent: animationController,
        curve: new Interval(0.8, 0.85, curve: Curves.easeIn)));
    newYorkFadeOut = new Tween<double>(begin: 1.0, end: 0.0)
        .animate(new CurvedAnimation(parent: animationController,
        curve: new Interval(0.82, 0.85)));

    losAngelesSlideIn = new AlignmentTween(
        begin: new Alignment(-1.0, -1.0), end: new Alignment(-1.0, 0.0))
        .animate(new CurvedAnimation(parent: animationController,
        curve: new Interval(0.8, 0.85, curve: Curves.easeIn)));
    losAngelesFadeIn = new Tween<double>(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animationController,
        curve: new Interval(0.82, 0.85)));

    londonSlideOut.addListener(() {
      setState(() {});
    });
    londonFadeOut.addListener(() {
      setState(() {});
    });

    newYorkSlideIn.addListener(() {
      setState(() {});
    });
    newYorkFadeIn.addListener(() {
      setState(() {});
    });

    newYorkSlideOut.addListener(() {
      setState(() {});
    });
    newYorkFadeOut.addListener(() {
      setState(() {});
    });

    losAngelesSlideIn.addListener(() {
      setState(() {});
    });
    losAngelesFadeIn.addListener(() {
      setState(() {});
    });

    new Future.delayed(
        new Duration(milliseconds: widget.delayInMilliseconds + 500))
        .then((_) {
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: 40.0,
      child: new Stack(
        children: <Widget>[
          // London
          new Align(
            alignment: londonSlideOut.value,
            child: new Opacity(
              opacity: londonFadeOut.value,
              child: new AnimatedText("London", widget.delayInMilliseconds,
                durationInMilliseconds: 500,
                textStyle: new TextStyle(color: Colors.green,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500),),
            ),
          ),
          // New York
          new AlignTransition(
            alignment: !(newYorkSlideIn.value.y == 0.0)
                ? newYorkSlideIn
                : newYorkSlideOut,
            child: new Opacity(
              opacity: !(newYorkFadeIn.value == 1.0)
                  ? newYorkFadeIn.value
                  : newYorkFadeOut.value,
              child: new Text(secondLocation, style: new TextStyle(
                  color: Colors.lightBlue.withOpacity(0.7),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500),
              ),
            ),
          ),

          // Los Angeles
          new Align(
            alignment: losAngelesSlideIn.value,
            child: new Opacity(
              opacity: losAngelesFadeIn.value,
              child: new Text(thirdLocation, style: new TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500),),
            ),
          ),

        ],
      ),
    );
  }

}