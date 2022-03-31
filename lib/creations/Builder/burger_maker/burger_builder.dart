import 'package:flutter/cupertino.dart';

import 'burger.dart';
import 'ingredient.dart';

/// BurgerBuilderBase
/// 是一个抽象类，存储 burger 和 price属性
/// 提供了创建，获取和设置burger价格的默认方法
/// 同时，也定义了一些抽象方法，需要由具体的生成器来实现这些方法
abstract class BurgerBuilderBase {
  @protected
  Burger? burger;

  @protected
  double? price;

  void createBurger() {
    burger = Burger();
  }

  Burger? getBurger() {
    return burger;
  }

  void setBurgerPrice() {
    burger?.setPrice(price);
  }

  void addBuns();
  void addCheese();
  void addPatties();
  void addSauces();
  void addSeasoning();
  void addVegetables();
}

class BigMacBuilder extends BurgerBuilderBase {
  BigMacBuilder() {
    price = 3.99;
  }
  @override
  void addBuns() {
    // TODO: implement addBuns
    burger?.addIngredient(BigMacBun());
  }

  @override
  void addCheese() {
    // TODO: implement addCheese
    burger?.addIngredient(Cheese());
  }

  @override
  void addPatties() {
    // TODO: implement addPatties
    burger?.addIngredient(BeefPatty());
  }

  @override
  void addSauces() {
    // TODO: implement addSauces
    burger?.addIngredient(BigMacSauce());
  }

  @override
  void addSeasoning() {
    // TODO: implement addSeasoning
    burger?.addIngredient(GrillSeasoning());
  }

  @override
  void addVegetables() {
    // TODO: implement addVegetables
    burger?.addIngredient(Onion());
    burger?.addIngredient(PickleSlices());
    burger?.addIngredient(ShreddedLettuce());
  }
}

class CheeseburgerBuilder extends BurgerBuilderBase {
  CheeseburgerBuilder() {
    price = 1.09;
  }

  @override
  void addBuns() {
    // TODO: implement addBuns
    burger?.addIngredient(RegularBun());
  }

  @override
  void addCheese() {
    // TODO: implement addCheese
    burger?.addIngredient(Cheese());
  }

  @override
  void addPatties() {
    // TODO: implement addPatties
    burger?.addIngredient(BeefPatty());
  }

  @override
  void addSauces() {
    // TODO: implement addSauces
    burger?.addIngredient(Ketchup());
    burger?.addIngredient(Mustard());
  }

  @override
  void addSeasoning() {
    // TODO: implement addSeasoning
    burger?.addIngredient(GrillSeasoning());
  }

  @override
  void addVegetables() {
    // TODO: implement addVegetables
    burger?.addIngredient(Onion());
    burger?.addIngredient(PickleSlices());
  }
}
