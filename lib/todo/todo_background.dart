import 'package:flutter/material.dart';

class TodoBackgroundLayer extends StatelessWidget {
  final LinearGradient linearGradient;

  TodoBackgroundLayer(
      {this.linearGradient: const LinearGradient(
          colors: const <Color>[
            const Color(0xFFF7A00A),
            const Color(0xFFF77473)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: const <double>[0.5, 0.6])});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        gradient: linearGradient,
      ),
    );
  }
}
