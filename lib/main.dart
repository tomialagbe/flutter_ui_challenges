import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

class ChallengeApp extends StatelessWidget {
  ChallengeApp() {
    // fix to portrait mode
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);

    // set to full screen
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: Colors.blue),
      title: 'Flutter Challenges',
      home: new HomePage(),
    );
  }
}

void main() => runApp(new ChallengeApp());
