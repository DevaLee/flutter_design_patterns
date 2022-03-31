import 'package:flutter/cupertino.dart';

abstract class Ingredient {
  /// 过敏原
  @protected
  List<String>? allergens;

  /// 名字
  @protected
  String? name;

  List<String>? getAllergens() {
    return allergens;
  }

  String? getName() {
    return name;
  }
}

/// 巨无霸面包
class BigMacBun extends Ingredient {
  BigMacBun() {
    name = 'Big Mac Run';
    allergens = ['Wheat'];
  }
}

/// 常规面包
class RegularBun extends Ingredient {
  RegularBun() {
    name = "Regular Bun";
    allergens = ['Wheat'];
  }
}

/// 牛肉饼
class BeefPatty extends Ingredient {
  BeefPatty() {
    name = 'Beef Patty';
    allergens = [];
  }
}

class McChickenPatty extends Ingredient {
  McChickenPatty() {
    name = 'McChicken Patty';
    allergens = ['Wheat', 'Cooked in the same fryer that we use...'];
  }
}

/// 巨无霸酱
class BigMacSauce extends Ingredient {
  BigMacSauce() {
    name = 'Big Mac Sauce';
    allergens = ['Egg', 'Soy', 'Wheat'];
  }
}

/// 番茄酱
class Ketchup extends Ingredient {
  Ketchup() {
    name = 'Ketchup';
    allergens = [];
  }
}

/// 蛋黄酱
class Mayonnaise extends Ingredient {
  Mayonnaise() {
    name = 'Mayonnaise';
    allergens = ['egg'];
  }
}

/// 芥末
class Mustard extends Ingredient {
  Mustard() {
    name = 'Mustard';
    allergens = [];
  }
}

/// 洋葱
class Onion extends Ingredient {
  Onion() {
    name = 'Onion';
    allergens = [];
  }
}

/// 奶油
class Cheese extends Ingredient {
  Cheese() {
    name = 'Cheese';
    allergens = ['Milk', 'Soy'];
  }
}

/// 烧烤调味料
class GrillSeasoning extends Ingredient {
  GrillSeasoning() {
    name = 'Grill Seasoning';
    allergens = [];
  }
}

/// 泡菜片
class PickleSlices extends Ingredient {
  PickleSlices() {
    name = 'Pickle Slices';
    allergens = [];
  }
}

/// 生菜丝
class ShreddedLettuce extends Ingredient {
  ShreddedLettuce() {
    name = 'Shredded Lettuce';
    allergens = [];
  }
}
