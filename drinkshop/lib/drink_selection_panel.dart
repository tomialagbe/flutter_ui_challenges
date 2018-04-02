import 'dart:async';

import 'package:drinkshop/add_button.dart';
import 'package:drinkshop/colors.dart';
import 'package:drinkshop/drink_carousel.dart';
import 'package:drinkshop/icons.dart';
import 'package:drinkshop/models.dart';
import 'package:drinkshop/settings_button.dart';
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
  Animation<double> carouselTranslateAnimation;

  AnimationController drinkTypeAnimationController;
  Animation<double> carouselSwitchTranslateAnimation;
  Animation<double> carouselOpacityAnimation;

  DrinkType currentDrinkType = DrinkType.frappe;

  int currentPage = 0;
  PageController pageController; // = new PageController(initialPage: cu);
  List<Drink> drinks;

  @override
  void initState() {
    super.initState();

    drinks = getDrinks(currentDrinkType);
    currentPage = (drinks.length / 2).round();
    pageController =
        new PageController(initialPage: currentPage, viewportFraction: 0.6);

    expansionAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));
    expandAnimation = new Tween<double>(begin: 80.0, end: 0.0).animate(
        new CurvedAnimation(
            parent: expansionAnimationController, curve: Curves.easeInOut));
    carouselTranslateAnimation = new Tween<double>(begin: 30.0, end: -50.0)
        .animate(new CurvedAnimation(
            parent: expansionAnimationController, curve: Curves.easeInOut));
    expandAnimation.addListener(() {
      setState(() {});
    });
    carouselTranslateAnimation.addListener(() {
      setState(() {});
    });

    drinkTypeAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 250));
    carouselSwitchTranslateAnimation = new Tween<double>(begin: 0.0, end: 40.0)
        .animate(new CurvedAnimation(
            parent: drinkTypeAnimationController, curve: Curves.easeInOut));
    carouselSwitchTranslateAnimation.addListener(() {
      setState(() {});
    });
    carouselOpacityAnimation = new Tween<double>(begin: 1.0, end: 0.0).animate(
        new CurvedAnimation(
            parent: drinkTypeAnimationController, curve: Curves.easeInOut));
    carouselOpacityAnimation.addListener(() {
      setState(() {});
    });

    widget.drinkTypeStream.stream.listen((type) async {
      await drinkTypeAnimationController.forward();
      setState(() {
        currentDrinkType = type;
      });
      drinkTypeAnimationController.reverse();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    drinks = getDrinks(currentDrinkType);
//    final carouselTransform = new Matrix4.translationValues(
//        0.0,
//        (-30.0 - carouselSwitchTranslateAnimation.value) +
//            carouselTranslateAnimation.value,
//        0.0);

    return new Stack(
      children: <Widget>[
        new ClipOval(
          clipper: new _CustomClipOval(
            clipOffset: expandAnimation.value + 50,
          ),
          child: new SizedBox(
            width: widget.size.width,
            height: widget.size.height,
            child: new Container(
              padding: const EdgeInsets.all(0.0),
              decoration: new BoxDecoration(
                color: DrinkShopColors.backgroundAccentColor,
              ),
              child: new DrinkCarousel(
                drinks: drinks,
//                drinkSwitchTransform: carouselTransform,
                drinkSwitchYTranslation: carouselSwitchTranslateAnimation.value,
                carouselExpandYTranslation: carouselTranslateAnimation.value,
                opacity: carouselOpacityAnimation.value,
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

  _CustomClipOval({this.clipOffset});

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
