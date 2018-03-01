import 'package:flutter/material.dart';
import 'package:ui_challenges/icons.dart';

class ProfileAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery
        .of(context)
        .padding
        .top + 10.0;
    return new Container(
      padding: new EdgeInsets.only(
          top: topPadding, bottom: 10.0, left: 10.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new IconButton(icon: new Icon(ThemifyIcons.user,
            color: Colors.white, size: 20.0,),
              onPressed: null),
          new Expanded(child: new Container()),
          new IconButton(icon: new Icon(ThemifyIcons.close,
            color: Colors.white, size: 20.0,),
            onPressed: () {
              Navigator.of(context).pop();
            },),
        ],
      ),
    );
  }
}