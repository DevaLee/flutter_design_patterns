import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AbstractFactoryPage extends StatefulWidget {
  const AbstractFactoryPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const AbstractFactoryPage());
  }

  @override
  _AbstractFactoryPageState createState() => _AbstractFactoryPageState();
}

class _AbstractFactoryPageState extends State<AbstractFactoryPage> {
  final List<IWidgetFactory> widgetsFactoryList = [
    MaterialIWidgetsFactory(),
    CupertinoWidgetsFactory()
  ];
  int groupValue = 1;

  int _selectedFactoryIndex = 0;
  late IActivityIndicator _activityIndicator;
  late ISlider _slider;
  double _sliderValue = 50.0;
  String get _sliderValueString => _sliderValue.toStringAsFixed(0);

  late ISwitch _switch;
  bool _switchValue = false;
  String get _switchValueString => _switchValue ? "ON" : "OFF";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createWidgets();
  }

  void _createWidgets() {
    _activityIndicator =
        widgetsFactoryList[_selectedFactoryIndex].createActivityIndicator();
    _slider = widgetsFactoryList[_selectedFactoryIndex].createSlider();
    _switch = widgetsFactoryList[_selectedFactoryIndex].createSwitch();
  }

  void _setSelectedFactoryIndex(int index) {
    _selectedFactoryIndex = index;
    _createWidgets();
  }

  void _setSliderValue(double value) {
    setState(() {
      _sliderValue = value * 100;
    });
  }

  void _setSwitchValue(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Radio(
                          value: 0,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value as int;
                              _setSelectedFactoryIndex(groupValue);
                            });
                          }),
                      spaceWidgetFactory(),
                      const Text("Android widgets"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value as int;
                              _setSelectedFactoryIndex(groupValue);
                            });
                          }),
                      spaceWidgetFactory(),
                      const Text("iOS widgets"),
                    ],
                  ),
                  spaceWidgetFactory(),
                  Text(
                    'Process indicator',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  spaceWidgetFactory(),
                  _activityIndicator.render(),
                  spaceWidgetFactory(),
                  Text(
                    'Slider $_sliderValueString%',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  _slider.render(_sliderValue / 100, _setSliderValue),
                  spaceWidgetFactory(),
                  Text(
                    'Switch $_switchValueString',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  spaceWidgetFactory(),
                  _switch.render(_switchValue, _setSwitchValue),
                ],
              ),
            )));
  }

  Widget spaceWidgetFactory() {
    return const SizedBox(height: 20);
  }
}

abstract class IActivityIndicator {
  Widget render();
}

abstract class ISlider {
  Widget render(double value, ValueSetter<double> onChanged);
}

abstract class ISwitch {
  Widget render(bool value, ValueSetter<bool> onChanged);
}

abstract class IWidgetFactory {
  String getTitle();
  IActivityIndicator createActivityIndicator();
  ISlider createSlider();
  ISwitch createSwitch();
}

class MaterialIWidgetsFactory implements IWidgetFactory {
  @override
  IActivityIndicator createActivityIndicator() {
    // TODO: implement createActivityIndicator
    return AndroidActivityIndicator();
  }

  @override
  ISlider createSlider() {
    // TODO: implement createSlider
    return AndroidSlider();
  }

  @override
  ISwitch createSwitch() {
    // TODO: implement createSwitch
    return AndroidSwitch();
  }

  @override
  String getTitle() {
    // TODO: implement getTitle
    return "Android Widgets";
  }
}

class CupertinoWidgetsFactory implements IWidgetFactory {
  @override
  IActivityIndicator createActivityIndicator() {
    // TODO: implement createActivityIndicator
    return IOSActivityIndicator();
  }

  @override
  ISlider createSlider() {
    // TODO: implement createSlider
    return IOSSlider();
  }

  @override
  ISwitch createSwitch() {
    // TODO: implement createSwitch
    return IOSSwitch();
  }

  @override
  String getTitle() {
    // TODO: implement getTitle
    return "iOS Widgets";
  }
}

class AndroidActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    // TODO: implement render
    return CircularProgressIndicator(
      backgroundColor: const Color(0xFFECECEC),
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black.withOpacity(0.65)),
    );
  }
}

class IOSActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    // TODO: implement render
    return const CupertinoActivityIndicator();
  }
}

class AndroidSwitch implements ISwitch {
  @override
  Widget render(bool value, ValueSetter<bool> onChanged) {
    // TODO: implement render
    return Switch(value: value, onChanged: onChanged);
  }
}

class IOSSwitch implements ISwitch {
  @override
  Widget render(bool value, ValueSetter<bool> onChanged) {
    // TODO: implement render
    return CupertinoSwitch(value: value, onChanged: onChanged);
  }
}

class AndroidSlider implements ISlider {
  @override
  Widget render(double value, ValueSetter<double> onChanged) {
    // TODO: implement render
    return Slider(value: value, onChanged: onChanged);
  }
}

class IOSSlider implements ISlider {
  @override
  Widget render(double value, ValueSetter<double> onChanged) {
    // TODO: implement render
    return CupertinoSlider(value: value, onChanged: onChanged);
  }
}
