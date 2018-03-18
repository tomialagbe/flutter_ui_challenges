import 'dart:async';

import 'package:drinkshop/add_button.dart';
import 'package:drinkshop/colors.dart';
import 'package:drinkshop/icons.dart';
import 'package:drinkshop/models.dart';
import 'package:flutter/material.dart';

class DrinkSelectionPanel extends StatefulWidget {
  final StreamController<DrinkType> drinkTypeStream;
  final Size size;

  DrinkSelectionPanel(this.drinkTypeStream, this.size);

  @override
  State createState() => new _DrinkSelectionPanelState();
}

class _DrinkSelectionPanelState extends State<DrinkSelectionPanel>
    with TickerProviderStateMixin {
  AnimationController expansionAnimationController;
  Animation<double> expandAnimation;

  DrinkType currentDrinkType = DrinkType.frappe;

  final scrollController = new ScrollController(initialScrollOffset: 0.0);

  @override
  void initState() {
    super.initState();

    expansionAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));
    expandAnimation = new Tween<double>(begin: 80.0, end: 0.0).animate(
        new CurvedAnimation(
            parent: expansionAnimationController, curve: Curves.easeInOut));
    expandAnimation.addListener(() {
      setState(() {});
    });

    widget.drinkTypeStream.stream.listen((type) {
      setState(() {
        // TODO: animate drink type switch
        currentDrinkType = type;
      });
    });

    scrollController.addListener(() {
      print("POSITION: ${scrollController.position.toString()}");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final drinks = getDrinks(currentDrinkType);

    return new Stack(
      children: <Widget>[
        new ClipOval(
          clipper: new _CustomClipOval(expandAnimation.value + 50),
          child: new SizedBox(
            width: widget.size.width,
            height: widget.size.height,
            child: new Container(
              decoration: new BoxDecoration(
                color: DrinkShopColors.backgroundAccentColor,
              ),
            ),
          ),
        ),
        new Positioned(
          // expanded -> top: widget.size.width + 110 (collapsed +10)
          left: widget.size.width / 6,
          top: widget.size.width + 10 + expandAnimation.value,
          child: new SettingsButton(),
        ),
        new Positioned(
          // expanded -> top: widget.size.width + 90 (collapsed -10)
          right: widget.size.width / 6,
          top: widget.size.width - 10 + expandAnimation.value,
          child: new AddButton(
            onTap: () {
              if (expansionAnimationController.status !=
                  AnimationStatus.completed) {
                expansionAnimationController.forward();
              } else {
                expansionAnimationController.reverse();
              }
            },
          ),
        ),
      ],
    );
  }
}

class _CustomClipOval extends CustomClipper<Rect> {
  final double clipOffset;

  _CustomClipOval(this.clipOffset);

  // expanded -> offset (size.width / 2, 150)
  // collapsed -> offset (size.width / 2, 50)
  @override
  Rect getClip(Size size) {
    return new Rect.fromCircle(
        center: new Offset(size.width / 2, clipOffset), radius: size.width);
  }

  @override
  bool shouldReclip(_CustomClipOval oldClipper) =>
      oldClipper.clipOffset != clipOffset;
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
