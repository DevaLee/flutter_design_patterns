import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/creations/Builder/burger_maker/burger.dart';

class BurgerInformationColumn extends StatelessWidget {
  final Burger burger;
  const BurgerInformationColumn({Key? key, required this.burger})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(burger.getFormattedPrice()),
        Text(
          'Ingredients',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(burger.getFormattedIngredients()),
        Text(
          'Allergens',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(burger.getFormattedAllergens())
      ],
    );
  }
}
