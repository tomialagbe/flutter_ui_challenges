import 'dart:math';

import 'package:drinkshop/drink_carousel_card.dart';
import 'package:drinkshop/drink_carousel_item.dart';
import 'package:drinkshop/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DrinkCarousel extends StatefulWidget {
  final double opacity;
  final double drinkSwitchYTranslation;
  final double carouselExpandYTranslation;

  DrinkCarousel({
    Key key,
    this.drinks,
    this.drinkSwitchYTranslation,
    this.carouselExpandYTranslation,
    this.opacity,
  });

  final List<Drink> drinks;

  @override
  State createState() => new _DrinkCarouselState();
}

class _DrinkCarouselState extends State<DrinkCarousel> {
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
    final switchTransform = new Matrix4.translationValues(
      0.0,
      (-30.0 - widget.drinkSwitchYTranslation) +
          (widget.carouselExpandYTranslation),
      0.0,
    );
    final expandTransform = new Matrix4.translationValues(
      0.0,
      (-30.0 + widget.carouselExpandYTranslation),
      0.0,
    );

    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Transform(
          transform: switchTransform,
          child: new Opacity(
            opacity: widget.opacity,
            child: new DrinkCarouselScroller(
              drinks: widget.drinks,
              size: new Size(MediaQuery.of(context).size.width, 400.0),
            ),
          ),
        ),
        new Transform(
          transform: expandTransform,
          child: new Align(
            alignment: new Alignment(-0.27, 0.40),
            child: new DrinkCarouselCard(),
          ),
        )
      ],
    );
  }
}

class DrinkCarouselScroller extends StatefulWidget {
  final List<Drink> drinks;
  final Size size;
  final int initialIndex;

  DrinkCarouselScroller({
    this.drinks,
    this.size,
    this.initialIndex: 3,
  })
      : assert(initialIndex < drinks.length);

  @override
  _DrinkCarouselScrollerState createState() =>
      new _DrinkCarouselScrollerState();
}

class _DrinkCarouselScrollerState extends State<DrinkCarouselScroller> {
  int currentActiveIndex;
  final activeItemSize = const Size(140.0, 200.0);

  @override
  void initState() {
    super.initState();
    currentActiveIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final children = _buildChildren();
    return new GestureDetector(
      child: new Flow(
        delegate: new DrinkCarouselScrollerDelegate(
          items: children,
          scrollerSize: widget.size,
          activeItemSize: activeItemSize,
          activeIndex: currentActiveIndex,
        ),
        children: children,
      ),
    );
  }

  List<DrinkCarouselItem> _buildChildren() {
    final children = <DrinkCarouselItem>[];
    for (var i = 0; i < widget.drinks.length; ++i) {
      final child = new DrinkCarouselItem(
        size: activeItemSize,
        drink: widget.drinks[i],
        onDrinkSelected: null,
        active: i == currentActiveIndex,
      );
      children.add(child);
    }
    return children;
  }
}

class DrinkCarouselScrollerDelegate extends FlowDelegate {
  static const int maxDrinksPerPage = 5; // show only 5 drinks on the page
  static const activeScale = 1.0;
  static const nextToActiveScale = 0.6;
  static const outerScale = 0.4;

  final List<DrinkCarouselItem> items;
  final Size scrollerSize;
  final Size activeItemSize;
  final int activeIndex;

  DrinkCarouselScrollerDelegate({
    this.items,
    this.scrollerSize,
    this.activeItemSize,
    this.activeIndex,
  });

  @override
  Size getSize(BoxConstraints constraints) => scrollerSize;

  @override
  void paintChildren(FlowPaintingContext context) {
    var transform;
    final activeItemXPosition =
        scrollerSize.width / 2 - (activeItemSize.width / 2);
    var activeIndexTransform =
        new Matrix4.translationValues(activeItemXPosition, 80.0, 0.0);

    for (int i = 0; i < context.childCount; i++) {
      int diff = (i - activeIndex).abs();
      switch (diff) {
        case 0:
          context.paintChild(
            i,
            transform: activeIndexTransform,
            opacity: 1.0,
          );
          break;
        case 1:
          {
            var xtransform = i < activeIndex
                ? -activeItemSize.width * 0.6
                : activeItemSize.width;
            transform = new Matrix4.copy(activeIndexTransform)
              ..translate(xtransform, (activeItemSize.height * 0.6) / 2, 0.0)
              ..scale(0.6);
            context.paintChild(
              i,
              transform: transform,
              opacity: 0.8,
            );
          }
          break;
        case 2:
        default:
          {
            var xtransform;
            if (transform == null) {
              xtransform = i < activeIndex
                  ? -activeItemSize.width * 0.6
                  : activeItemSize.width;
              transform = new Matrix4.copy(activeIndexTransform)
                ..translate(xtransform, (activeItemSize.height * 0.6) / 2, 0.0)
                ..scale(0.6);
            }
            xtransform = i < activeIndex
                ? ((-activeItemSize.width * 0.6) * 0.8)
                : activeItemSize.width;
            transform = new Matrix4.copy(transform)
              ..translate(
                xtransform,
                ((activeItemSize.height * 0.6) * 0.8) / 2,
                0.0,
              )
              ..scale(0.8 * 0.6);
            context.paintChild(
              i,
              transform: transform,
              opacity: 0.6,
            );
          }
          break;
      }
    }
  }

  @override
  bool shouldRepaint(DrinkCarouselScrollerDelegate oldDelegate) {
    return true;
  }
}
