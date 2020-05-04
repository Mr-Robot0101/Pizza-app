import 'package:flutter/cupertino.dart';

class AddressesStateObject extends ChangeNotifier{
  List<Map<String, String>> addresses = [
    {
      "address": "sulduz-koy 1",
      "title": "Home",
      "main": "false"
    }
  ];
  int _widgetIndex = 0;

  get address => addresses;
  get widgetNumber => _widgetIndex;

  void goingToAddingWidget(){
    _widgetIndex = 1;
    notifyListeners();
  }

  void addingNewAddressAndShowingThem(Map<String, String> newAddress){
    addresses.add(newAddress);
    _widgetIndex = 0;
    notifyListeners();
  }

}