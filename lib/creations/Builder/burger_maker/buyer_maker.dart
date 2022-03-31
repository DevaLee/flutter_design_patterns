import 'burger.dart';
import 'burger_builder.dart';

/// director
/// 管理汉堡的构建过程并返回构建结果
class BurgerMaker {
  BurgerBuilderBase? burgerBuilder;
  BurgerMaker(this.burgerBuilder);

  void changeBurgerBuilder(BurgerBuilderBase burgerBuilder) {
    this.burgerBuilder = burgerBuilder;
  }

  Burger? getBurger() {
    return burgerBuilder?.getBurger();
  }

  void prepareBurger() {
    burgerBuilder?.createBurger();
    burgerBuilder?.setBurgerPrice();

    burgerBuilder?.addBuns();
    burgerBuilder?.addCheese();
    burgerBuilder?.addPatties();
    burgerBuilder?.addSauces();
    burgerBuilder?.addSeasoning();
    burgerBuilder?.addVegetables();
  }
}
