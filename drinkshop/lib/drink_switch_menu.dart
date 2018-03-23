import 'dart:async';
import 'dart:math';

import 'package:drinkshop/models.dart';
import 'package:flutter/material.dart';

class DrinkSwitchMenu extends StatefulWidget {
  final StreamController<DrinkType> drinkTypeStream;

  DrinkSwitchMenu(this.drinkTypeStream);

  @override
  State createState() => new DrinkSwitchMenuState();
}

class DrinkSwitchMenuState extends State<DrinkSwitchMenu>
    with TickerProviderStateMixin {
  AnimationController controller;

  Animation<double> drinksScaleAnimation;
  Animation<double> drinksTiltAnimation;
  Animation<double> drinksTranslateAnimation;

  static Key frappeKey = new Key("__frappe__");
  static Key glassKey = new Key("__glass__");
  Key active = frappeKey;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 200));
    drinksScaleAnimation = new Tween<double>(begin: 1.0, end: 1.5).animate(
        new CurvedAnimation(
            parent: controller,
            curve: new Interval(0.0, 0.5, curve: Curves.easeIn)));
    drinksTiltAnimation = new Tween<double>(begin: 0.0, end: 40.0).animate(
        new CurvedAnimation(
            parent: controller,
            curve: new Interval(0.0, 0.5, curve: Curves.easeIn)));
    drinksTranslateAnimation = new Tween<double>(begin: 0.0, end: 30.0).animate(
        new CurvedAnimation(
            parent: controller,
            curve: new Interval(0.0, 0.5, curve: Curves.easeIn)));

    drinksScaleAnimation.addListener(() {
      setState(() {});
    });
    drinksTiltAnimation.addListener(() {
      setState(() {});
    });
    drinksTranslateAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inactiveTransform = new Matrix4.identity()
      ..translate(-10.0 - drinksTranslateAnimation.value, 0.0, 0.0)
      ..scale(drinksScaleAnimation.value, drinksScaleAnimation.value)
      ..rotateZ(-drinksTiltAnimation.value * (PI / 180));
    final activeTransform = new Matrix4.identity()
      ..translate(0.0, 10.0 + drinksTranslateAnimation.value, 0.0)
      ..scale(drinksScaleAnimation.value, drinksScaleAnimation.value)
      ..rotateZ(drinksTiltAnimation.value * (PI / 180));

    final glass = new Transform(
      key: glassKey,
      transform: active == glassKey ? activeTransform : inactiveTransform,
      origin: new Offset(20.0, 20.0),
      child: new Image.asset(
        "assets/images/glass.png",
        width: 35.0,
        height: 35.0,
      ),
    );

    final frappe = new Transform(
      key: frappeKey,
      transform: active == frappeKey ? activeTransform : inactiveTransform,
      origin: new Offset(20.0, 20.0),
      child: new Image.asset(
        "assets/images/frappe.png",
        width: 35.0,
        height: 35.0,
      ),
    );

    return new GestureDetector(
      onTap: () {
        swapDrinks();
      },
      child: new Container(
        child: new Stack(
          children: active == glassKey
              ? <Widget>[frappe, glass]
              : <Widget>[glass, frappe],
        ),
      ),
    );
  }

  void swapDrinks() async {
    await controller.forward();

    widget.drinkTypeStream
        .add(active == frappeKey ? DrinkType.glass : DrinkType.frappe);

    await controller.reverse();

    setState(() {
      if (active == glassKey) {
        active = frappeKey;
      } else if (active == frappeKey) {
        active = glassKey;
      }
    });
  }
}
