import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/creations/Prototype/shape.dart';

class Circle extends Shape {
  late double radius;
  Circle(Color color, this.radius) : super(color);

  Circle.initial() : super(Colors.black) {
    radius = 50.0;
  }
  Circle.clone(Circle source) : super.clone(source) {
    radius = source.radius;
  }

  @override
  Shape clone() {
    return Circle.clone(this);
  }

  @override
  void randomiseProperties() {
    var random = Random();

    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
  }

  @override
  Widget render() {
    // TODO: implement render
    return SizedBox(
      height: 120,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 2 * radius,
          width: 2 * radius,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: const Icon(
            Icons.abc,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
