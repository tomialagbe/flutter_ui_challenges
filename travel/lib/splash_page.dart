import 'dart:async';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:travel/stacked_circles.dart';

class SplashPage extends StatefulWidget {
  @override
  State createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage> with TickerProviderStateMixin {

  final circleDiameter = 50.0;
  AnimationController _controller;
  Animation<Alignment> alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    _playStackedCirclesAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Null> _playStackedCirclesAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
      await _controller
          .animateTo(0.400)
          .orCancel;
      await Navigator.of(context).pushNamed("/landing");
    } on TickerCanceled {
      //animation cancelled
    }
  }
  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new Scaffold(
      body: new Center(
        child: new Hero(
          tag: "CircleHeroTag",
          child: new StackedCirclesAnimation(
            controller: _controller.view,
          ),
        ),
      ),
    );
  }

}

