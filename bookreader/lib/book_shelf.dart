import 'package:bookreader/book_row.dart';
import 'package:flutter/material.dart';

class BookShelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.blue[900],
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Hero(
                tag: 'image-hero',
                child: new Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: new Image.asset('assets/images/owl.png',
                      width: 50.0, height: 50.0, color: Colors.white),
                )),
            new Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: new Text('Discover. Learn. Elevate.',
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w200)),
            ),
            new Container(
              height: 450.0,
              width: double.infinity,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(topLeft: const Radius.circular(30.0), topRight: const Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: new DefaultTabController(
                length: 3,
                child: new Column(
                  children: <Widget>[
                    new TabBar(
                      indicatorWeight: 3.0,
                      isScrollable: true,
                      labelColor: Colors.black87,
                      tabs: <Widget>[
                        new Tab(text: 'BOOKS'),
                        new Tab(text: 'PODCAST'),
                        new Tab(text: 'WORKSHOPS'),
                      ],
                    ),
                    new BookRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
