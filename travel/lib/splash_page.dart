import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel/stacked_circles.dart';

class SplashPage extends StatefulWidget {
  @override
  State createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  @override
  void initState() async {
    await new Future.delayed(new Duration(seconds: 2));
    Navigator.of(context).pushNamed("/landing");
  }

  @override
  Widget build(BuildContext context) {
    final circleDiameter = 50.0;

    return new Scaffold(
      body: new Center(
        child: new Hero(
          tag: "CircleHeroTag",
          child: new StackedCircles(circleDiameter),
        ),
      ),
    );
  }

}

