import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

class ChallengeApp extends StatelessWidget {
  ChallengeApp() {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.blue),
      title: 'Flutter Challenges',
      home: new HomePage(),
    );
  }
}

void main() => runApp(new ChallengeApp());
