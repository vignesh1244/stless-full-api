import 'package:flutter/material.dart';

class SliderProviderOne with ChangeNotifier {
  double _value = 1.0;

  double get value => _value;

  void setValue(double vall){
    _value=vall;
    notifyListeners();
  }
}
