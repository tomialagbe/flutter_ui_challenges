import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  @override
  State createState() => new AnimatedBackgroundState();

}

class AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> imageSizeAnimation;
  Animation<double> imageSlideAnimation;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 6000));
    imageSizeAnimation = new Tween<double>(begin: 0.0, end: 1.0).animate(
        new CurvedAnimation(
            parent: animationController,
            curve: new Interval(0.0, 0.1, curve: Curves.bounceInOut)));
    imageSlideAnimation = new Tween<double>(begin: 0.0, end: 0.5).animate(
        new CurvedAnimation(parent: animationController,
            curve: new Interval(0.1, 1.0, curve: Curves.linear)));

    imageSlideAnimation.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Align(
        alignment: new Alignment(1.0, -0.3),

        child: new ClipPath(
          child: new Image(
              alignment: new Alignment(imageSlideAnimation.value, 0.0),
              width: 250.0 * imageSizeAnimation.value,
              height: 350.0 * imageSizeAnimation.value,
              image: new AssetImage("assets/bar.jpg"),
              fit: BoxFit.cover),
          clipper: new _AnimatedBackgroundImageClipper(),
        ),
      ),
    );
  }
}

class _AnimatedBackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset ctrl;
    Offset end;

    Path path = new Path();
    path.moveTo(size.width, 0.0);

    path.lineTo(0.2 * size.width, size.height * 0.5 - 20);

    ctrl = new Offset(-0.35 * size.width, size.height);
    end = new Offset(0.6 * size.width, size.height * 0.95);
    path.quadraticBezierTo(ctrl.dx, ctrl.dy, end.dx, end.dy);

    path.lineTo(0.6 * size.width, size.height * 0.95);

    ctrl = new Offset(0.7 * size.width, size.height - 20);
    end = new Offset(0.8 * size.width, size.height * 0.9);
    path.quadraticBezierTo(ctrl.dx, ctrl.dy, end.dx, end.dy);

    path.lineTo(0.8 * size.width, size.height * 0.9);

    ctrl = new Offset(0.9 * size.width, size.height * 0.9 - 15);
    end = new Offset(size.width, size.height * 0.8);
    path.quadraticBezierTo(ctrl.dx, ctrl.dy, end.dx, end.dy);

    path.lineTo(size.width, size.height * 0.8);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}