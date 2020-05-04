import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationStateObject extends ChangeNotifier{

  Color _itemColor = Colors.orange;
  int _index = 0;

  int get value => _index;
  Color get color => _itemColor;

  void setting(Color selectedColor){
    _itemColor = selectedColor;
    notifyListeners();
  }

  void doit(int a){
    _index = a;
    notifyListeners();
  }

}