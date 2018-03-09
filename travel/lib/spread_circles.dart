import 'package:flutter/material.dart';

class SpreadCircles extends StatefulWidget {

  @override
  State createState() => new SpreadCirclesState();
}

class SpreadCirclesState extends State<SpreadCircles>
    with SingleTickerProviderStateMixin {

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
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Align(alignment: new Alignment(-1.0, 0.0),
            child: new Container(
              width: 20.0, height: 30.0, color: Colors.lightBlue,),)
        ],
      ),
    );
  }
}

class SemiCircle extends StatelessWidget {

  final Color color;
  final double diameter;

  SemiCircle(this.color, this.diameter);

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      size: new Size(diameter, diameter),
      painter: new SemiCirclePainter(color),
    );
  }

}

class SemiCirclePainter extends CustomPainter {

  final Color color;

  SemiCirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        new Offset(size.width / 2, size.height / 2), size.width / 2,
        new Paint()..color = this.color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}