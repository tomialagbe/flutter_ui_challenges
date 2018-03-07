import 'package:flutter/material.dart';
import 'package:profile/main_menu.dart';
import 'package:profile/models.dart';
import 'package:profile/profile_colors.dart';
import 'package:profile/profile_icons.dart';
import 'package:profile/profile_header.dart';
import 'package:profile/quick_actions.dart';

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
    final iconColor = new Color(0xFFCCCCCC);
    final navigationItems = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: new Icon(LineAwesomeIcons.home, color: iconColor),
          title: new Text("")),
      new BottomNavigationBarItem(
          icon: new Icon(LineAwesomeIcons.bookmark, color: iconColor,),
          title: new Text("")),
      new BottomNavigationBarItem(
          icon: new Icon(LineAwesomeIcons.thumbsUp, color: iconColor,),
          title: new Text("")),
      new BottomNavigationBarItem(
          icon: new Icon(
            LineAwesomeIcons.user, color: ProfileColors.primaryColor,),
          title: new Text(""))
    ];

    final profile = getProfile();

    return new Scaffold(
      body: new ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          new ProfileHeader(profile),
          new QuickActions(),
          new MainMenu(),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: 0,
        items: navigationItems,
        onTap: (index) {},
        fixedColor: ProfileColors.primaryColor,
        iconSize: 25.0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

}