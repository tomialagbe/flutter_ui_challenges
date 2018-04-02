import 'package:flutter/material.dart';
import 'package:bookreader/icons.dart';

void main() => runApp(new BookReaderApp());

class BookReaderApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Book Reader',
      home: new BookReaderHomePage(),
    );
  }
}

class BookReaderHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.blue[900],
        child:  new Stack(
          children: <Widget>[
            new Align(
              alignment: new FractionalOffset(0.95, 0.06),
              child: new Icon(BookReaderIcons.menu, color: Colors.white, size: 17.0),
            ),
            new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: new Image.asset(
                        'assets/images/owl.png',
                        width: 70.0,
                        height: 70.0,
                        color: Colors.white
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: new Text(
                        'Discover, Learn, Elevate',
                        style: const TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w300)),
                  ),
                  new Opacity(
                    opacity: 1.0,
                    child: new Container(decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(30.0)),
                      child: new ClipRRect(
                        borderRadius: new BorderRadius.circular(50.0),
                        child: new MaterialButton(
                          minWidth: 180.0,
                          onPressed: null,
                          color: Colors.white,
                          child: new Text('Start Exploring', style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

