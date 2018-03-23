import 'package:drinkshop/colors.dart';
import 'package:drinkshop/icons.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AddButton extends StatefulWidget {
  final VoidCallback onTap;

  AddButton({@required this.onTap});

  @override
  State createState() => new _AddButtonState();
}

class _AddButtonState extends State<AddButton>
    with SingleTickerProviderStateMixin {
  final double radius = 90.0;
  double radiusScale = 1.0;

  AnimationController buttonAnimationController;
  Animation<double> buttonScaleAnimation;

  @override
  void initState() {
    super.initState();

    buttonAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 150));
    buttonScaleAnimation = new Tween<double>(begin: 1.0, end: 0.8).animate(
        new CurvedAnimation(
            parent: buttonAnimationController, curve: Curves.easeIn));
    buttonScaleAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () async {
        await buttonAnimationController.forward();
        widget.onTap();
        await buttonAnimationController.reverse();
      },
      child: new Container(
        width: radius * buttonScaleAnimation.value,
        height: radius * buttonScaleAnimation.value,
        decoration: new BoxDecoration(
          color: DrinkShopColors.buttonColor,
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black26,
              spreadRadius: 1.0,
              blurRadius: 3.0,
              offset: new Offset(1.0, 2.0),
            ),
          ],
        ),
        child: new Icon(
          DrinkShopIcons.plus,
          color: Colors.white,
        ),
      ),
    );
  }
}
