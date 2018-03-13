import 'package:drinkshop/drink_shop_home.dart';
import 'package:flutter/material.dart';

class DrinkShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Drink Shop",
      home: new DrinkShopHome(),
    );
  }
}

void main() => runApp(new DrinkShopApp());
