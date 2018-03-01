import 'package:flutter/material.dart';
import 'package:ui_challenges/icons.dart';

import 'profile_models.dart';

class ProfileInfo extends StatefulWidget {

  final List<ProfileModel> models;
  _ProfileInfoState _state;

  ProfileInfo(this.models) {
    _state = new _ProfileInfoState();
  }

  @override
  State createState() => _state;

  void pageChanged(int oldPage, int newPage) {
    _state.pageChanged(oldPage, newPage);
  }
}

class _ProfileInfoState extends State<ProfileInfo>
    with TickerProviderStateMixin {

  final topgrey = new Color(0xFFDBDBDB);
  final bottomgrey = new Color(0xFFEEEEEE);
  final iconcolor = new Color(0xFF888888);
  final buttoncolor = new Color(0xFFDB2010);

  static final textColor = const Color(0xFF777777);


  final aboutTextStyle = new TextStyle(
      fontSize: 14.0,
      fontFamily: "afta-sans-italic",
      fontWeight: FontWeight.w300,
      color: textColor);

  AnimationController swipeAnimationController;
  Animation swipeAnimation;
  bool isSwipedUp = false;
  double swipeMax = 220.0;

  AnimationController slideAnimationController;
  Animation slideOutAnimation;
  Animation fadeOutAnimation;
  Animation slideInAnimation;
  Animation fadeInAnimation;

  int currentPage = 0;
  ProfileModel model;

  @override
  void initState() {
    super.initState();
    model = widget.models[0];
    _initSlideAnimations();
    _initSwipeAnimations();
  }

  void _initSlideAnimations() {
    slideAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 600));

    final outCurve = new CurvedAnimation(
        parent: slideAnimationController,
        curve: new Interval(0.0, 0.5, curve: Curves.easeOut));
    final inCurve = new CurvedAnimation(
        parent: slideAnimationController,
        curve: new Interval(0.5, 1.0, curve: Curves.easeOut));
    slideOutAnimation =
        new Tween<double>(begin: 20.0, end: 0.0).animate(outCurve);
    fadeOutAnimation =
        new Tween<double>(begin: 1.0, end: 0.0).animate(outCurve);
    slideInAnimation =
        new Tween<double>(begin: 0.0, end: 20.0).animate(inCurve);
    fadeInAnimation = new Tween<double>(begin: 0.0, end: 1.0).animate(inCurve);

    slideAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        slideAnimationController.reset();
      }
    });

    slideOutAnimation.addListener(() {
      setState(() {
        if (slideOutAnimation.value == 0) {
          model = widget.models[currentPage];
        }
      });
    });


    fadeOutAnimation.addListener(() {
      setState(() {});
    });
    slideInAnimation.addListener(() {
      setState(() {});
    });
    fadeInAnimation.addListener(() {
      setState(() {});
    });
  }

  void _initSwipeAnimations() {
    swipeAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 200));
    final curve = new CurvedAnimation(
        parent: swipeAnimationController, curve: Curves.easeInOut);
    swipeAnimation = new Tween<double>(begin: 0.0, end: swipeMax)
        .animate(curve);

    swipeAnimation.addListener(() {
      setState(() {});
    });

    swipeAnimation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          isSwipedUp = true;
        });
      } else if (status == AnimationStatus.reverse) {
        setState(() {
          isSwipedUp = false;
        });
      }
    });
  }

  void pageChanged(int oldPage, int newPage) {
    setState(() {
      currentPage = newPage;
      slideAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final statsMainTextStyle = new TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold);
    final statsSubTextStyle = new TextStyle(color: Colors.white70);
    return new Column(
      children: <Widget>[
        new Opacity(
          opacity: fadeOutAnimation.value > 0.1
              ? fadeOutAnimation.value
              : fadeInAnimation.value,
          child: new Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(model.numFollowersAsString,
                        style: statsMainTextStyle),
                    new Text("followers", style: statsSubTextStyle),
                  ],
                ),
                new Expanded(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(model.numPostsAsString,
                          style: statsMainTextStyle),
                      new Text("posts", style: statsSubTextStyle),
                    ],
                  ),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Text(model.numFollowingAsString,
                        style: statsMainTextStyle),
                    new Text("following", style: statsSubTextStyle),
                  ],
                ),
              ],
            ),
          ),),
        new Container(
            margin: new EdgeInsets.only(top: slideOutAnimation.value > 0.1
                ? slideOutAnimation.value
                : slideInAnimation.value, bottom: 0.0)),
        new Container(
          margin: const EdgeInsets.only(
              left: 10.0, right: 10.0, bottom: 5.0),
          decoration: new BoxDecoration(color: topgrey,
            borderRadius: new BorderRadius.all(new Radius.circular(30.0),),),
          child: new Column(
            children: <Widget>[
              _buildTopInfo(),
              _buildSubInfo(),
              _buildButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopInfo() {
    final buttonTextStyle = new TextStyle(
        fontSize: 11.0,
        fontWeight: FontWeight.w600,
        color: buttoncolor,
        letterSpacing: 3.0);
    final nameStyle = new TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: textColor);
    final locationStyle = new TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w400, color: textColor);

    return new GestureDetector(
      onVerticalDragStart: (DragStartDetails details) {
        if (isSwipedUp) {
          swipeAnimationController.reverse();
        } else {
          swipeAnimationController.forward();
        }
      },
      child: new Container(
        decoration: new BoxDecoration(color: topgrey,
          borderRadius: new BorderRadius.only(
            topLeft: new Radius.circular(30.0),
            topRight: new Radius.circular(30.0),
          ),
        ),        
        // padding: new EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        padding: new EdgeInsets.only(
          top: 30.0,
          // bottom: 30.0,
          bottom: slideOutAnimation.value > 0.1 ? slideOutAnimation.value + 10.0 : slideInAnimation.value + 10.0,
          left: 20.0,
          right: 20.0),
        child: new Opacity(
          opacity: fadeOutAnimation.value > 0.1 ? fadeOutAnimation.value : fadeInAnimation.value,
          child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              flex: 2,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("${model.firstName} ${model.lastName}",
                    style: nameStyle,),
                  new Padding(padding: const EdgeInsets.only(top: 5.0)),
                  new Text("${model.location}", style: locationStyle,),
                ],
              ),
            ),
            new Expanded(
              flex: 1,
              child: new FlatButton(
                onPressed: () {},
                child: new Text("FOLLOW", style: buttonTextStyle),
                shape: new RoundedRectangleBorder(
                    side: new BorderSide(color: buttoncolor,
                        style: BorderStyle.solid,
                        width: 2.0),
                    borderRadius: new BorderRadius.all(
                        new Radius.circular(20.0))),
                color: Colors.transparent,
                highlightColor: buttoncolor,
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  Widget _buildSubInfo() {
    final subtitleStyle = new TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: textColor);
    return new Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      height: swipeAnimation.value,
      color: topgrey,
      child: swipeAnimation.value == swipeMax ? new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(model.about, style: aboutTextStyle,),
          new Padding(padding: const EdgeInsets.only(bottom: 20.0)),
          new Text("Photos", style: subtitleStyle),
          new Padding(padding: const EdgeInsets.only(bottom: 10.0)),
          new Container(
            constraints: new BoxConstraints.tightFor(height: 100.0),
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: _buildSubInfoPhotos(),
            ),
          ),
        ],
      ) : new Container(),
    );
  }

  List<Widget> _buildSubInfoPhotos() {
    final list = new List.generate(4, (int value) => value).map((i) {
      final imagePath = "assets/profile/images/${i + 1}.jpg";
      return new Container(
        width: 100.0, height: 100.0,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: new BoxDecoration(
          image: new DecorationImage(image: new AssetImage(
              imagePath), fit: BoxFit.cover),
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        ),
      );
    }).toList();
    return list;
  }


  Widget _buildButtons() {
    return new Container(
      padding: const EdgeInsets.symmetric(
          vertical: 20.0, horizontal: 30.0),
      decoration: new BoxDecoration(
        color: bottomgrey,
        borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
              child: new IconButton(
                  icon: new Icon(PixedenIcons.newspaper,
                      color: iconcolor),
                  highlightColor: buttoncolor,
                  splashColor: buttoncolor,
                  onPressed: () {})),
          new Expanded(child: new IconButton(
              icon: new Icon(PixedenIcons.search,
                color: iconcolor,), onPressed: () {})),
          new Expanded(
            child: new RaisedButton(
                elevation: 10.0,
                padding: const EdgeInsets.all(10.0),
                color: buttoncolor,
                shape: new CircleBorder(),
                child: new Icon(
                    ThemifyIcons.plus, color: Colors.white),
                onPressed: () {}),
          ),
          new Expanded(
              child: new IconButton(
                  icon: new Icon(ThemifyIcons.bell, color: iconcolor),
                  onPressed: () {})),
          new Expanded(
              child: new IconButton(
                  icon: new Icon(PixedenIcons.chat, color: iconcolor),
                  onPressed: () {})),

        ],
      ),
    );
  }
}