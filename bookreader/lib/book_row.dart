import 'package:bookreader/book.dart';
import 'package:flutter/material.dart';

class BookRow extends StatelessWidget {

  PageController pageController = new PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return  new Container(
      height: 380.0,
      width: double.infinity,
      child: new PageView(
          controller: pageController,
          children: books.map((Book book){
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: new Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(10.0),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(color: Colors.black38,
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                        offset: new Offset(0.0, 1.0)),
                  ],
                ),
                child: new Column(
                  children: [
                    new Container(
                      height: 250.0,
                      width: double.infinity,
                      child: new Image.asset(book.asset, fit: BoxFit.cover),
                    ),
                    new Text(book.title, style: const TextStyle(fontSize: 25.0), textAlign: TextAlign.right),
                    new Text(book.author),
                    new RaisedButton(
                        color: Colors.blue[900],
                        onPressed: null,
                        child: new Text('Read Book'),
                    ),
                  ],
                ),
              ),
            );
          }).toList()
      ),
    );
  }
}
