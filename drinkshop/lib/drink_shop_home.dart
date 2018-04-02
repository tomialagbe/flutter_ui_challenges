import 'dart:async';

import 'package:drinkshop/colors.dart';
import 'package:drinkshop/drink_selection_panel.dart';
import 'package:drinkshop/header.dart';
import 'package:drinkshop/models.dart';
import 'package:flutter/material.dart';

class DrinkShopHome extends StatefulWidget {
  @override
  State createState() => new DrinkShopHomeState();
}

class DrinkShopHomeState extends State<DrinkShopHome> {
  StreamController<DrinkType> drinkTypeStream;

  @override
  void initState() {
    super.initState();
    drinkTypeStream = new StreamController<DrinkType>();
  }

  @override
  void dispose() {
    drinkTypeStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final panelSize = new Size(screenWidth, screenHeight * (3 / 4));
    return new Scaffold(
      body: new Container(
        color: DrinkShopColors.backgroundColor,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: new Stack(
          children: <Widget>[
            new DrinkSelectionPanel(drinkTypeStream, panelSize),
            new DrinkShopHeader(drinkTypeStream),
            _buildOrderItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItems() {
    return new Align(
      alignment: new Alignment(0.0, 0.8),
      child: new Text(
        "YOUR ORDER WILL APPEAR HERE",
        style: new TextStyle(
          color: DrinkShopColors.backgroundAccentColor,
        ),
      ),
    );
  }
}
