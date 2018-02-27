import 'package:flutter/material.dart';

import 'todo_models.dart';
import 'todo_progress_line.dart';

class TodoGroupCard extends StatelessWidget {
  final TaskGroup group;
  final Color highlightColor;
  final IconData iconData;

  TodoGroupCard(this.group,
      {this.highlightColor: const Color(0xFFF77473),
      this.iconData: Icons.person});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(
          right: 20.0, left: 10.0, bottom: 10.0, top: 2.0),
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black12,
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: new Offset(1.0, 3.0)),
          ]),
      child: new Stack(
        children: <Widget>[
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: new Row(
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: new Border.all(
                        color: Colors.black26,
                        width: 2.0,
                        style: BorderStyle.solid),
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: new Icon(iconData, color: highlightColor),
                ),
                new Expanded(child: new Container()),
                new PopupMenuButton(
                  icon: new Icon(Icons.more_vert, color: Colors.black26),
                  itemBuilder: (ctx) {
                    return <PopupMenuEntry>[];
                  },
                  onSelected: (s) {},
                ),
              ],
            ),
          ),
          new Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("${group.numTasks} Tasks",
                      style: new TextStyle(
                          color: Colors.black45,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400)),
                  new Padding(padding: const EdgeInsets.only(top: 5.0)),
                  new Text(
                    "${group.groupName}",
                    style: new TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 35.0),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: new ProgressLine(
                      group.numTasks.toDouble(),
                      group.numComplete.toDouble(),
                      color: highlightColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
