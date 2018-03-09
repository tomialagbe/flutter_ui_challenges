import 'package:flutter/material.dart';

import 'package:travel/splash_page.dart';
import 'package:travel/landing_page.dart';

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Travel App",
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/landing':
            return new SplashPageToLandingPageRoute(
                builder: (_) => new LandingPage(),
                settings: settings
            );
        }
      },
      home: new SplashPage(),
    );
  }
}

void main() => runApp(new TravelApp());

class SplashPageToLandingPageRoute<T> extends MaterialPageRoute<T> {
  SplashPageToLandingPageRoute(
      { WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => new Duration(milliseconds: 1500);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;

    final curve = new CurvedAnimation(
        parent: animation, curve: Curves.easeInOut);
    return new FadeTransition(opacity: curve, child: child);
  }
}
