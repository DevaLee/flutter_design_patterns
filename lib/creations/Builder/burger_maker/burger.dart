import 'ingredient.dart';

/// Burger
class Burger {
  final List<Ingredient> _ingredients = [];
  double? _price;

  /// 添加配料
  void addIngredient(Ingredient ingredient) {
    _ingredients.add(ingredient);
  }

  /// 获取所有配料
  String getFormattedIngredients() {
    return _ingredients.map((e) => e.getName()).join('.');
  }

  /// 获取所有的过敏原
  String getFormattedAllergens() {
    var allergens = <String>{};
    for (var element in _ingredients) {
      allergens.addAll(element.getAllergens() ?? []);
    }
    return allergens.join('.');
  }

  /// 价格
  String getFormattedPrice() {
    return '\$${_price?.toStringAsFixed(2)}';
  }

  void setPrice(double? price) {
    _price = price;
  }
}
