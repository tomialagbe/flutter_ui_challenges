import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'profile_app_bar.dart';
import 'profile_pager.dart';
import 'profile_info.dart';
import 'profile_models.dart';

class ProfileHomePage extends StatefulWidget {

  @override
  State createState() => new _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {

  List<ProfileModel> profileModels;
  int currentPageIndex = 0;
  ProfileInfo profileInfo;

  @override
  void initState() {
    super.initState();
    profileModels = getProfiles();
    profileInfo = new ProfileInfo(profileModels);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return new Scaffold(
      body: new Container(
        color: Colors.black,
        child: new Stack(
          children: <Widget>[
            new Positioned.fill(
              child: new ProfilePager(
                  profileModels, <PageChangedListener>[_pageChanged]),
              bottom: 160.0,),
            new Positioned(
                top: 0.0, left: 0.0, right: 0.0, child: new ProfileAppBar()),
            new Positioned(
              bottom: 0.0, left: 0.0, right: 0.0,
              child: profileInfo,
            ),
          ],
        ),
      ),
    );
  }

  void _pageChanged(int newPage) {
    int oldPage = currentPageIndex;
    setState(() {
      currentPageIndex = newPage;
    });
    profileInfo.pageChanged(oldPage, newPage);
  }

}