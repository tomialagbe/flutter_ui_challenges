import 'package:drinkshop/drink_shop_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrinkShopApp extends StatelessWidget {
  DrinkShopApp() {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Drink Shop",
      home: new DrinkShopHome(),
    );
  }
}

void main() => runApp(new DrinkShopApp());
