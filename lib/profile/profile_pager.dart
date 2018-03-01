import 'package:flutter/material.dart';

import 'profile_models.dart';

class ProfilePager extends StatefulWidget {

  final List<ProfileModel> models;
  final List<PageChangedListener> pageChangedListeners;

  ProfilePager(this.models, this.pageChangedListeners);

  @override
  State createState() => new _ProfilePagerState();

}

class _ProfilePagerState extends State<ProfilePager> {

  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new PageView(
          onPageChanged: (int newPage) {
            widget.pageChangedListeners.forEach((
                PageChangedListener listener) => listener(newPage));
          },
          scrollDirection: Axis.horizontal,
          controller: pageController,
          children: widget.models.map((ProfileModel model) {
            return new Image.asset(
              model.imageAsset, scale: 1.0, fit: BoxFit.cover,);
          }).toList(),),
        new Positioned(
          bottom: 0.0, left: 0.0, right: 0.0,
          child: new Container(
            height: 100.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.bottomCenter, end: Alignment.topCenter,
                stops: <double>[
                  0.0,
                  0.1,
                  0.4,
                  0.5,
                  0.7,
                  0.8,
                  0.9,
                  0.95,
                  1.0
                ],
                colors: <Color>[
                  new Color(0xDD000000),
                  new Color(0xCC000000),
                  new Color(0xBB000000),
                  new Color(0xAA000000),
                  new Color(0x99000000),
                  new Color(0x44000000),
                  new Color(0x33000000),
                  new Color(0x22000000),
                  new Color(0x11000000),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}