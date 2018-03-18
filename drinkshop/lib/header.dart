import 'dart:async';

import 'package:drinkshop/colors.dart';
import 'package:drinkshop/drink_switch_menu.dart';
import 'package:drinkshop/icons.dart';
import 'package:flutter/material.dart';

class DrinkShopHeader extends StatelessWidget {

  final StreamController drinkTypeStream;

  DrinkShopHeader(this.drinkTypeStream);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100.0,
      padding: new EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
          left: 20.0,
          right: 20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new IconButton(
              icon: new Icon(
                DrinkShopIcons.menu,
                color: DrinkShopColors.headerIconColor,
                size: 30.0,
              ),
              onPressed: () {}),
          new Expanded(
            child: new Container(),
          ),
          new DrinkSwitchMenu(drinkTypeStream),
        ],
      ),
    );
  }
}
