import 'dart:async';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:travel/circles.dart';

class SplashPage extends StatefulWidget {
  @override
  State createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {

  final circleDiameter = 50.0;

  AnimationController controller1;
  Animation<double> translation1;
  Animation<double> scale1;
  Animation<double> translation1Reverse;
  Animation<double> scale1Reverse;

  Animation<double> translation2;
  Animation<double> scale2;
  Animation<double> translation2Reverse;
  Animation<double> scale2Reverse;

  Animation<double> translation3;
  Animation<double> scale3;
  Animation<double> translation3Reverse;
  Animation<double> scale3Reverse;

  Animation<double> translation4;

  double currentTranslation = 0.0;
  double currentScale = 1.0;

  @override
  void initState() {
    super.initState();

    controller1 =
    new AnimationController(vsync: this, duration: const Duration(seconds: 7));
    translation1 = new Tween<double>(begin: 50.0, end: -20.0).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.0, 0.14, curve: Curves.easeInOut)));
    scale1 = new Tween<double>(begin: 0.8, end: 0.4).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.0, 0.14, curve: Curves.linear)));

    translation1Reverse = new Tween<double>(begin: -20.0, end: 55.0).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.14, 0.28, curve: Curves.easeInOut)));
    scale1Reverse = new Tween<double>(begin: 0.4, end: 0.85).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.14, 0.28, curve: Curves.linear)));

    translation2 = new Tween<double>(begin: 55.0, end: -20.0).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.28, 0.42, curve: Curves.easeInOut)));
    scale2 = new Tween<double>(begin: 0.85, end: 0.4).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.28, 0.42, curve: Curves.linear)));

    translation2Reverse = new Tween<double>(begin: -20.0, end: 60.0).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.42, 0.57, curve: Curves.easeInOut)));
    scale2Reverse = new Tween<double>(begin: 0.4, end: 0.9).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.42, 0.57, curve: Curves.linear)));

    translation3 = new Tween<double>(begin: 60.0, end: -20.0).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.57, 0.71, curve: Curves.easeInOut)));
    scale3 = new Tween<double>(begin: 0.9, end: 0.4).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.57, 0.71, curve: Curves.linear)));

    translation3Reverse = new Tween<double>(begin: -20.0, end: 65.0).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.71, 0.85, curve: Curves.easeInOut)));
    scale3Reverse = new Tween<double>(begin: 0.4, end: 1.0).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.71, 0.85, curve: Curves.linear)));

    translation4 = new Tween<double>(begin: 65.0, end: 15.0).animate(
        new CurvedAnimation(parent: controller1,
            curve: new Interval(0.85, 1.0, curve: Curves.linear)));

    translation1.addListener(() {
      setCurrentTranslation(translation1);
    });
    scale1.addListener(() {
      setCurrentScale(scale1);
    });

    translation1Reverse.addListener(() {
      if (translation1.value == -20) {
        setCurrentTranslation(translation1Reverse);
      }
    });

    scale1Reverse.addListener(() {
      if (scale1.value == 0.4) {
        setCurrentScale(scale1Reverse);
      }
    });

    translation2.addListener(() {
      if (translation1Reverse.value == 55) {
        setCurrentTranslation(translation2);
      }
    });
    scale2.addListener(() {
      if (scale1Reverse.value == 0.85) {
        setCurrentScale(scale2);
      }
    });

    translation2Reverse.addListener(() {
      if (translation2.value == -20) {
        setCurrentTranslation(translation2Reverse);
      }
    });

    scale2Reverse.addListener(() {
      if (scale2.value == 0.4) {
        setCurrentScale(scale2Reverse);
      }
    });

    translation3.addListener(() {
      if (translation2Reverse.value == 60) {
        setCurrentTranslation(translation3);
      }
    });
    scale3.addListener(() {
      if (scale2Reverse.value == 0.9) {
        setCurrentScale(scale3);
      }
    });

    translation3Reverse.addListener(() {
      if (translation3.value == -20) {
        setCurrentTranslation(translation3Reverse);
      }
    });

    scale3Reverse.addListener(() {
      if (scale3.value == 0.4) {
        setCurrentScale(scale3Reverse);
      }
    });

    translation4.addListener(() {
      if (translation3Reverse.value == 65) {
        setCurrentTranslation(translation4);
      }
    });

    controller1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        showLandingPage();
      }
    });

    controller1.forward();
  }

  void setCurrentTranslation(Animation<double> animation) {
    setState(() {
      currentTranslation = animation.value;
    });
  }

  void setCurrentScale(Animation<double> scaleAnimation) {
    setState(() {
      currentScale = scaleAnimation.value;
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final matrix1 = new Matrix4.translationValues(
        -1 * currentTranslation, 0.0, 0.0);
    matrix1.scale(currentScale, currentScale);
    final matrix2 = new Matrix4.translationValues(currentTranslation, 0.0, 0.0);
    matrix2.scale(currentScale, currentScale);

    return new Scaffold(
      body: new Center(
        child: new Hero(
          tag: "CircleHeroTag",
          child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Transform(
                transform: matrix1,
                child: new Circle(
                    color: Colors.purple, diameter: circleDiameter),
              ),
              new Transform(
                transform: matrix2,
                child: new Opacity(
                  opacity: 0.8,
                  child: new Circle(
                      color: Colors.yellow, diameter: circleDiameter),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showLandingPage() {
    new Future.delayed(new Duration(milliseconds: 500)).then((_) =>
        Navigator.of(context).pushNamed("/landing"));
  }

}

