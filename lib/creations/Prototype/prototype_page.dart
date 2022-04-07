import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/creations/Prototype/circle.dart';
import 'package:flutter_design_patterns/creations/Prototype/rectangle.dart';

import 'shape.dart';

class PrototypePage extends StatefulWidget {
  const PrototypePage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(builder: (context) => const PrototypePage());
  }

  @override
  State<PrototypePage> createState() => _PrototypeState();
}

class _PrototypeState extends State<PrototypePage> {
  final Shape _circle = Circle.initial();
  final Shape _rectangle = Rectangle.initial();

  late Shape _circleClone;
  late Shape _rectangleClone;

  void _randomiseCircleProperties() {
    setState(() {
      _circle.randomiseProperties();
    });
  }

  void _cloneCircle() {
    setState(() {
      _circleClone = _circle.clone();
    });
  }

  void _randomiseRectangleProperties() {
    setState(() {
      _rectangle.randomiseProperties();
    });
  }

  void _cloneRectangle() {
    setState(() {
      _rectangleClone = _rectangle.clone();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _circleClone = _circle.clone();
    _rectangleClone = _rectangle.clone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('prototype'),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              ShapeColumn(
                shape: _circle,
                shapeClone: _circleClone,
                onClonePressed: _cloneCircle,
                onRandomisePropertiesPressed: _randomiseCircleProperties,
              ),
              ShapeColumn(
                shape: _rectangle,
                shapeClone: _rectangleClone,
                onClonePressed: _cloneRectangle,
                onRandomisePropertiesPressed: _randomiseRectangleProperties,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShapeColumn extends StatelessWidget {
  final Shape shape;
  final Shape shapeClone;
  final void Function() onClonePressed;
  final void Function() onRandomisePropertiesPressed;
  const ShapeColumn(
      {Key? key,
      required this.shape,
      required this.shapeClone,
      required this.onClonePressed,
      required this.onRandomisePropertiesPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text('Original shape'),
                shape.render(),
              ],
            ),
            Column(
              children: [
                const Text('Cloned Shape'),
                shapeClone.render(),
              ],
            )
          ],
        ),
        CupertinoButton(
          child: Text('Randomise properties',
              style: Theme.of(context).textTheme.subtitle1),
          onPressed: onRandomisePropertiesPressed,
        ),
        CupertinoButton(
          child: Text(
            'Clone',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          onPressed: onClonePressed,
        ),
      ],
    );
  }
}
