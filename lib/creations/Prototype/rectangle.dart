import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/creations/Prototype/shape.dart';

class Rectangle extends Shape {
  late double height;
  late double width;
  Rectangle(Color color, this.height, this.width) : super(color);

  Rectangle.initial() : super(Colors.black) {
    height = 100.0;
    width = 100.0;
  }

  Rectangle.clone(Rectangle source) : super.clone(source) {
    height = source.height;
    width = source.width;
  }

  @override
  Shape clone() {
    return Rectangle.clone(this);
  }

  @override
  void randomiseProperties() {
    // TODO: implement randomiseProperties
    var random = Random();

    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    height = (random.nextInt(50) + 50).toDouble();
    width = (random.nextInt(50) + 50).toDouble();
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: height,
          width: width,
          decoration: BoxDecoration(color: color, shape: BoxShape.rectangle),
          child: const Icon(
            Icons.abc,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
