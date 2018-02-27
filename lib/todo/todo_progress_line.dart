import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  final double max;
  final double value;
  final bool showText;
  final Color color;

  ProgressLine(this.max, this.value,
      {this.color: const Color(0xFFF77473), this.showText: true});

  @override
  Widget build(BuildContext context) {
    double dval = (value / max) * 100;
    int intval = dval.round();
    return new Row(
      children: <Widget>[
        new Expanded(child: _buildLine(dval)),
        new Padding(padding: const EdgeInsets.only(right: 10.0)),
        new Text("$intval%", style: new TextStyle(color: Colors.black38)),
      ],
    );
  }

  Widget _buildLine(double percent) {
    final lineHeight = 2.0;
    return new CustomPaint(
      painter: new ProgressLinePainter(lineHeight, percent, color),
    );
  }
}

class ProgressLinePainter extends CustomPainter {
  final Color color; // = new Color(0xFFF77473);
  final double lineHeight;
  final double percentage;

  ProgressLinePainter(this.lineHeight, this.percentage, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    double drawWidth = (percentage / 100) * size.width;
    canvas.drawRect(new Rect.fromLTWH(0.0, 0.0, size.width, lineHeight),
        new Paint()..color = Colors.black38);
    canvas.drawRect(new Rect.fromLTWH(0.0, 0.0, drawWidth, lineHeight),
        new Paint()..color = color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
