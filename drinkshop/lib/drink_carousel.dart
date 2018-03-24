import 'dart:math' as math;
import 'dart:math';
import 'package:drinkshop/colors.dart';
import 'package:drinkshop/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DrinkCarousel extends StatefulWidget {
  final Matrix4 drinkSwitchTransform;
  final double opacity;
  final double drinkSwitchYTranslation;
  final double carouselExpandYTranslation;

  DrinkCarousel({
    Key key,
    this.drinks,
//    this.drinkSwitchTransform,
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

    final children = _buildItems();
    return new Stack(
      children: <Widget>[
        new Transform(
//          transform: widget.drinkSwitchTransform,
          transform: switchTransform,
          child: new Opacity(
            opacity: widget.opacity,
            child: new Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
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

  List<Widget> _buildItems() {
    final items = <Widget>[];
    final int mid = (widget.drinks.length / 2).round();
    for (int i = 0; i < widget.drinks.length; ++i) {
      if (i >= mid - 2 && i <= mid + 2) {
        var item;
        if (i == mid) {
          item = new DrinkCarouselItem(
            size: new Size(110.0, 170.0),
            drink: widget.drinks[i],
            active: true,
          );
        } else if ((mid - i).abs() == 1) {
          item = new DrinkCarouselItem(
            size: new Size(55.0, 80.0),
            drink: widget.drinks[i],
            active: false,
          );
        } else {
          item = new DrinkCarouselItem(
            size: new Size(45.0, 50.0),
            drink: widget.drinks[i],
            active: false,
          );
        }
        items.add(item);
      }
    }
    return items;
  }
}

class DrinkCarouselItem extends StatefulWidget {
  DrinkCarouselItem({this.size, this.drink, this.active: false});

  final Size size;

  final Drink drink;

  final bool active;

  @override
  State createState() => new DrinkCarouselItemState();
}

class DrinkCarouselItemState extends State<DrinkCarouselItem>
    with SingleTickerProviderStateMixin {
  AnimationController onTapAnimationController;
  Animation<double> tiltAnimation;
  Animation<double> translateAnimation;

  @override
  void initState() {
    super.initState();

    onTapAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));
    tiltAnimation = new Tween<double>(begin: 0.0, end: 20.0).animate(
        new CurvedAnimation(
            parent: onTapAnimationController,
            curve: new Interval(0.0, 1.0, curve: Curves.easeInOut)));
    translateAnimation = new Tween<double>(begin: 0.0, end: 40.0).animate(
        new CurvedAnimation(
            parent: onTapAnimationController,
            curve: new Interval(0.0, 1.0, curve: Curves.easeInOut)));

    tiltAnimation.addListener(() {
      setState(() {});
    });
    translateAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final transform = new Matrix4.translationValues(
        (-1 * translateAnimation.value) + 10.0,
        -1 * translateAnimation.value,
        0.0)
      ..rotateZ(-1 * tiltAnimation.value * (math.PI / 180));
    return new GestureDetector(
      onTap: _tapped,
      child: new Transform(
        alignment: Alignment.center,
        transform: transform,
        child: new SizedBox(
          width: widget.size.width,
          height: widget.size.height,
          child: new Image.asset(
            widget.drink.asset,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _tapped() async {
    if (widget.active) {
      await onTapAnimationController.forward();
      onTapAnimationController.reverse();
    }
  }
}

class DrinkCarouselCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      size: new Size(110.0, 80.0),
      painter: new DrinkCarouselCardPainter(),
    );
  }
}

class DrinkCarouselCardPainter extends CustomPainter {
  final Paint cardPaint;
  final Paint cardLinePaint;
  final Paint cardBackPaint;

  DrinkCarouselCardPainter()
      : cardPaint = new Paint(),
        cardBackPaint = new Paint(),
        cardLinePaint = new Paint() {
    cardPaint.color = DrinkShopColors.carouselCardColor;
    cardPaint.style = PaintingStyle.fill;
    cardLinePaint.color = DrinkShopColors.carouselCardLineColor;
    cardLinePaint.style = PaintingStyle.fill;
    cardBackPaint.color = DrinkShopColors.carouselCardBackColor;
    cardBackPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path cardBackPath = new Path();
    cardBackPath.moveTo(0.8 * size.width, 0.0);
    cardBackPath.lineTo(size.width, 0.6 * size.height);
    cardBackPath.lineTo(0.2 * size.width, 0.6 * size.height);
    cardBackPath.close();
    canvas.drawPath(cardBackPath, cardBackPaint);

    Path cardPath = new Path();
    cardPath.moveTo(0.2 * size.width, 0.0);
    cardPath.lineTo(0.0, 0.7 * size.height);
    cardPath.lineTo(0.6 * size.width, size.height);
    cardPath.lineTo(0.8 * size.width, 0.0);
    cardPath.close();
    canvas.drawPath(cardPath, cardPaint);

    canvas.rotate(8 * (PI / 180));
    canvas.save();

    final horizontalPadding = 5.0;
    final verticalPadding = 10.0;
    final lineHeight = 20.0;
    var rrect = new RRect.fromLTRBR(
      0.2 * size.width + horizontalPadding,
      verticalPadding,
      0.7 * size.width - horizontalPadding,
      lineHeight,
      new Radius.circular(5.0),
    );
    canvas.drawRRect(rrect, cardLinePaint);

    canvas.rotate(4 * (PI / 180));

    rrect = new RRect.fromLTRBR(
      0.2 * size.width + horizontalPadding,
      (verticalPadding) + lineHeight,
      0.7 * size.width - horizontalPadding,
      (2 * verticalPadding) + (lineHeight),
      new Radius.circular(5.0),
    );
    canvas.drawRRect(rrect, cardLinePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
