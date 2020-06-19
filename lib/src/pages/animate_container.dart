import 'package:flutter/material.dart';

import 'dart:math';

class AnimateContainerPage extends StatefulWidget {
  AnimateContainerPage({Key key}) : super(key: key);

  @override
  _AnimateContainerPageState createState() => _AnimateContainerPageState();
}

class _AnimateContainerPageState extends State<AnimateContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(
            seconds: 1
          ),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),  
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _cambiarPropiedad(),
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _cambiarPropiedad() {
    final random = Random();

    setState(() {
      _height = random.nextInt(300).toDouble();
      _width = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1.0
      );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}