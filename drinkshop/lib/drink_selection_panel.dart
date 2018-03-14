import 'dart:async';

import 'package:drinkshop/colors.dart';
import 'package:drinkshop/icons.dart';
import 'package:drinkshop/models.dart';
import 'package:flutter/material.dart';

class DrinkSelectionPanel extends StatefulWidget {
  final StreamController<DrinkType> drinkTypeStream;

  DrinkSelectionPanel(this.drinkTypeStream);

  @override
  State createState() => new _DrinkSelectionPanelState();
}

class _DrinkSelectionPanelState extends State<DrinkSelectionPanel>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new ClipOval(
          clipper: new _CustomClipOval(),
          child: new Container(
            decoration: new BoxDecoration(
              color: DrinkShopColors.backgroundAccentColor,
            ),
          ),
        ),
        new Positioned(
          left: MediaQuery.of(context).size.width / 6,
          top: MediaQuery.of(context).size.width + 10,
          child: new SettingsButton(),
        ),
        new Positioned(
          right: MediaQuery.of(context).size.width / 6,
          top: MediaQuery.of(context).size.width - 10,
          child: new AddButton(),
        ),
      ],
    );
  }
}

class _CustomClipOval extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromCircle(
        center: new Offset(size.width / 2, 50.0), radius: size.width);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 90.0,
      height: 90.0,
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
    );
  }
}

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
