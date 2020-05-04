import 'package:flutter/cupertino.dart';

import 'UserObjectInterface.dart';

class UserObject extends ChangeNotifier implements UserObjectInterface {
  UserObject() : super();

  @override
  List<Map<String, dynamic>> _currentOrdersList;

  @override
  List<Map<String, String>> _locations = [];

  @override
  int _mainAddressIndex;

  @override
  int _offPercent;

  @override
  int _widgetNumber = 0;

  @override
  List<List<Map<String, dynamic>>> _ordersHistory;

  @override
  get locations => _locations;

  @override

  get widgetNumber => _widgetNumber;

  @override
  get mainAddressIndex => _mainAddressIndex;

  @override
  void setMainAddress(int index) {
    _mainAddressIndex = index;
    notifyListeners();
  }

  @override
  void changingWidget() {
    _widgetNumber = 1;
    notifyListeners();
  }

  @override
  void addingNewLocationAndChangingTheWidget(Map newAddress, bool isItMain) {
    _locations.add(newAddress);
    if(isItMain == true)
      _mainAddressIndex = _locations.length - 1;
      _locations[_mainAddressIndex]["main"] = "true";
    _widgetNumber = 0;
    notifyListeners();
  }

  @override
  void addingToCart(Map<String, String> newOrder) {
    for(int i=0;i < _currentOrdersList.length;i++){
      if(_currentOrdersList[i] == newOrder){
        _currentOrdersList[i]["num"] += 1;
        break;
      }
    }
    _currentOrdersList.add(newOrder);
  }

  @override
  double currentOrdersPayCalculation() {
    double _finalPay;
    if (_currentOrdersList != null){
      for(int i=0;i < _currentOrdersList.length;i++){
        _finalPay += _currentOrdersList[i]["num"];
      }
      return _finalPay;
    }else{
      return 0.00;
    }
  }

  @override
  void forcingNotification() {
    // TODO: implement ForcingNotification
  }

  @override
  void validation() {
    // TODO: implement Validation
  }




}