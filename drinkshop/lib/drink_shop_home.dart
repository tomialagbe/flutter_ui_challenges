import 'package:drinkshop/colors.dart';
import 'package:flutter/material.dart';

class DrinkShopHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: DrinkShopColors.backgroundColor,
        child: new Stack(
          children: <Widget>[
            _buildTopPanel(),
            _buildOrderItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPanel() {
    return new Stack(
      children: <Widget>[
        new ClipOval(
          clipper: new CustomClipOval(),
          child: new Container(
            decoration: new BoxDecoration(
              color: DrinkShopColors.backgroundAccentColor,
            ),
          ),
        ),
        new Row(
          children: <Widget>[

          ],
        ),
      ],
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

class CustomClipOval extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromCircle(
        center: new Offset(size.width / 2, 50.0), radius: size.width);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
