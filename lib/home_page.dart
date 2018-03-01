import 'package:flutter/material.dart';
import 'package:ui_challenges/profile/profile_home_page.dart';
import 'todo/todo_home_page.dart';

class HomePage extends StatelessWidget {

  final List<MapEntry<String, Widget>> pages = <
      MapEntry<String, Widget>>[
    new MapEntry("Todo Concept", new TodoHomePage()),
    new MapEntry("Social UI", new ProfileHomePage()),
  ];

  BuildContext scaffoldContext;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("FLUTTER UI CHALLENGES")),
      body: new Builder(builder: (ctx) {
        scaffoldContext = ctx;
        return new ListView.builder(itemBuilder: (ctx, idx) {
          if (idx < pages.length) {
            final titleText = pages[idx].key;
            final page = pages[idx].value;
            return new ListTile(title: new Text(titleText),
                leading: new CircleAvatar(backgroundColor: Colors.blue),
                onTap: () {
                  if (page != null) {
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (c) => page));
                  } else {
                    Scaffold.of(scaffoldContext).showSnackBar(
                        new SnackBar(content: new Text("Page not available")));
                  }
                });
          }
        });
      }),
    );
  }
}