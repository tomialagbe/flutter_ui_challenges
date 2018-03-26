import 'dart:math';

import 'package:drinkshop/colors.dart';
import 'package:flutter/material.dart';

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
