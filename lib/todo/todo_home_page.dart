import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'todo_app_bar.dart';
import 'todo_avatar.dart';
import 'todo_background.dart';
import 'todo_group_card.dart';
import 'todo_models.dart';

class TodoHomePage extends StatefulWidget {
  @override
  State createState() => new _TodoHomePage();
}

class _TodoHomePage extends State<TodoHomePage> with TickerProviderStateMixin {
  TodoHomeModel model;
  PageController pageController;
  int currentPage = 0;
  int numPages;

  final textTheme = new TextTheme(
    body1: new TextStyle(fontSize: 13.0, color: new Color(0xDDFFFFFF)),
    body2: new TextStyle(
        fontSize: 13.0,
        color: new Color(0xDDFFFFFF),
        fontWeight: FontWeight.bold),
  );

  List<LinearGradient> linearGradients;
  List<Color> activeColors;
  List<IconData> activeIcons;

  static const gradientSops = const <double>[0.5, 0.6];

  @override
  void initState() {
    super.initState();
    model = getHomeModel();
    pageController = new PageController(initialPage: 0, viewportFraction: 0.80);

    numPages = model.taskGroups.length;

    linearGradients = const <LinearGradient>[
      const LinearGradient(
        colors: const <Color>[const Color(0xFFF7A00A), const Color(0xFFF77473)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: gradientSops,
      ),
      const LinearGradient(
        colors: const <Color>[const Color(0xFF49B7F7), const Color(0xFF3C97CC)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: gradientSops,
      ),
      const LinearGradient(
        colors: const <Color>[const Color(0xFF35C967), const Color(0xFF2CA856)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: gradientSops,
      ),
    ];
    activeColors =
        linearGradients.map((gradient) => gradient.colors.last).toList();
    activeIcons = const <IconData>[Icons.person, Icons.work, Icons.home];
  }

  @override
  Widget build(BuildContext context) {
    final dateString =
        new DateFormat.yMMMMd().format(new DateTime.now()).toUpperCase();

    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Stack(
        children: <Widget>[
          new TodoBackgroundLayer(
            linearGradient: linearGradients[currentPage],
          ),
          new Positioned(
              child: new TodoAppBar(), top: 0.0, left: 0.0, right: 0.0),
          _buildOverviewText(),
          new Positioned(
            child: new Text(
              "TODAY: $dateString",
              style: textTheme.body2,
            ),
            top: MediaQuery.of(context).size.height / 2 - 50.0,
            left: 45.0,
            right: 0.0,
          ),
          new Positioned(
            child: _buildPager(),
            top: MediaQuery.of(context).size.height / 2 - 30.0,
            left: 0.0,
            right: 0.0,
            bottom: 40.0,
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewText() {
    return new Padding(
      padding: const EdgeInsets.only(
          top: TodoAppBar.height + 20.0, left: 45.0, right: 45.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: new TodoAvatar(),
          ),
          new Text(
            "Hello, ${model.name}.",
            style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28.0),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child:
                new Text("Looks like you feel good.", style: textTheme.body1),
          ),
          new Text("You have 3 tasks to do today", style: textTheme.body1),
        ],
      ),
    );
  }

  Widget _buildPager() {
    return new PageView(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      pageSnapping: true,
      children: model.taskGroups
          .map((TaskGroup tg) => new TodoGroupCard(
                tg,
                highlightColor: activeColors[currentPage],
                iconData: activeIcons[currentPage],
              ))
          .toList(),
      onPageChanged: (int newPageIndex) {
        setState(() {
          currentPage = newPageIndex;
        });
      },
    );
  }
}
