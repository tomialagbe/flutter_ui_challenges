import 'dart:math';

import 'package:drinkshop/models.dart';
import 'package:flutter/material.dart';

class DrinkCarouselItem extends StatefulWidget {
  final Size size;
  final Drink drink;
  final bool active;
  final Function(Drink) onDrinkSelected;

  DrinkCarouselItem({
    this.size,
    this.drink,
    this.active: false,
    this.onDrinkSelected,
  });

  @override
  State createState() => new DrinkCarouselItemState();
}

class DrinkCarouselItemState extends State<DrinkCarouselItem>
    with SingleTickerProviderStateMixin {
  AnimationController onTapAnimationController;
  Animation<double> tiltAnimation;
  Animation<double> translateAnimation;

  @override
  void initState() {
    super.initState();

    onTapAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));
    tiltAnimation = new Tween<double>(begin: 0.0, end: 40.0).animate(
        new CurvedAnimation(
            parent: onTapAnimationController,
            curve: new Interval(0.0, 1.0, curve: Curves.easeInOut)));
    translateAnimation = new Tween<double>(begin: 0.0, end: 60.0).animate(
        new CurvedAnimation(
            parent: onTapAnimationController,
            curve: new Interval(0.0, 1.0, curve: Curves.easeInOut)));

    tiltAnimation.addListener(() {
      setState(() {});
    });
    translateAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final transform = new Matrix4.translationValues(
        (-1 * translateAnimation.value) + 10.0,
        -1 * translateAnimation.value,
        0.0)
      ..rotateZ(-1 * tiltAnimation.value * (PI / 180));
    return new GestureDetector(
      onTap: _tapped,
      child: new Transform(
        alignment: Alignment.center,
        transform: transform,
        child: new SizedBox(
          width: widget.size.width,
          height: widget.size.height,
          child: new Image.asset(
            widget.drink.asset,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _tapped() async {
    if (widget.active) {
      await onTapAnimationController.forward();
      await onTapAnimationController.reverse();
      if (null != widget.onDrinkSelected) {
        widget.onDrinkSelected(widget.drink);
      }
    }
  }
}
