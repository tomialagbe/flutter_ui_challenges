import 'package:flutter/material.dart';

void main() => runApp(new ProfileApp());


class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Profile Challenge',
      home: new ProfileHomePage()
    );
  }
}

class ProfileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }

}