import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/creations/Builder/burger_infomation_column.dart';
import 'package:flutter_design_patterns/creations/Builder/burger_maker/burger_builder.dart';
import 'package:flutter_design_patterns/creations/Builder/burger_maker/buyer_maker.dart';

import 'burger_maker/burger.dart';

class BuilderPatternPage extends StatefulWidget {
  const BuilderPatternPage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionDuration: const Duration(milliseconds: 500),
        opaque: false,
        pageBuilder: (context, animate, secondaryAnimation) {
          return const BuilderPatternPage();
        },
        transitionsBuilder: (context, animated, secondAnimated, widget) =>
            ScaleTransition(
              alignment: Alignment.bottomCenter,
              filterQuality: FilterQuality.high,
              scale: Tween<double>(begin: 0, end: 1).animate(animated),
              child: widget,
            ));
  }

  @override
  _BuilderPageState createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPatternPage> {
  int groupValue = 0;
  final BurgerMaker _burgerMaker = BurgerMaker(BigMacBuilder());
  final List<BurgerMenuItem> _burgerMenuItems = [];
  BurgerMenuItem? _selectedBurgerMenuItem;
  Burger? _selectedBurger;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _burgerMenuItems.addAll([
      BurgerMenuItem(label: 'Big Mac Burger', burgerBuilder: BigMacBuilder()),
      BurgerMenuItem(
          label: 'Cheese Burger', burgerBuilder: CheeseburgerBuilder())
    ]);
    _selectedBurgerMenuItem = _burgerMenuItems[0];

    _selectedBurger = _prepareSelectedBurger();
  }

  Burger? _prepareSelectedBurger() {
    _burgerMaker.prepareBurger();
    return _burgerMaker.getBurger();
  }

  void _onBurgerMenuItemChanged(BurgerMenuItem? burgerMenuItem) {
    if (burgerMenuItem != null) {
      setState(() {
        _selectedBurgerMenuItem = burgerMenuItem;
        _burgerMaker.changeBurgerBuilder(burgerMenuItem.burgerBuilder);
        _selectedBurger = _prepareSelectedBurger();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Builder Pattern'),
        ),
        body: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Select menu Item',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  DropdownButton(
                      value: _selectedBurgerMenuItem,
                      items: _burgerMenuItems
                          .map<DropdownMenuItem<BurgerMenuItem>>((e) =>
                              DropdownMenuItem(value: e, child: Text(e.label)))
                          .toList(),
                      onChanged: _onBurgerMenuItemChanged),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Information',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  _selectedBurger != null
                      ? BurgerInformationColumn(burger: _selectedBurger!)
                      : Container(),

                  // Row(
                  //   children: [
                  //     Radio(
                  //         value: 0,
                  //         groupValue: groupValue,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             groupValue = value as int;
                  //           });
                  //         }),
                  //     const Text("Big Mac Burger"),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Radio(
                  //         value: 1,
                  //         groupValue: groupValue,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             groupValue = value as int;
                  //           });
                  //         }),
                  //     const Text("Cheese Burger"),
                  //   ],
                  // ),
                ],
              ),
            )));
  }
}

class BurgerMenuItem {
  final String label;
  final BurgerBuilderBase burgerBuilder;

  BurgerMenuItem({required this.label, required this.burgerBuilder});
}
