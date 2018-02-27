import 'package:flutter/material.dart';

class TodoAvatar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage("assets/todo/images/avatar.jpeg"),
            fit: BoxFit.cover,
            alignment: Alignment.center),
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black12,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: new Offset(1.0, 1.0)),
        ],
      ),
    );
  }

}