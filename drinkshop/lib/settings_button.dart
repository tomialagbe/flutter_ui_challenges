import 'package:drinkshop/colors.dart';
import 'package:drinkshop/icons.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
        color: DrinkShopColors.buttonAccentColor,
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
        DrinkShopIcons.controls,
        color: Colors.white,
      ),
    );
  }
}
