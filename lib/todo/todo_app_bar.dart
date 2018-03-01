import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TodoAppBar extends StatelessWidget {
  static const height = 80.0;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery
        .of(context)
        .padding
        .top;
    return new Container(
      height: height,
      padding: new EdgeInsets.only(top: topPadding, left: 10.0, right: 10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            flex: 3,
            child: new Row(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(const IconData(0xe802, fontFamily: 'fontello'),
                      size: 18.0, color: Colors.white),
                  onPressed: null,
                ),
                new Expanded(
                  child: new Text(
                    "TODO",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          new IconButton(
            icon: new Icon(
              FontAwesomeIcons.search,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
    );
  }
}
