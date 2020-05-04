
// USER OBJECT INTERFACE
class UserObjectInterface {

  final String _username;
  final String _hashedPassword;
  final num _phoneNumber;
  int _widgetNumber;
  int _offPercent;
  List<Map<String, String>> _locations;
  int _mainAddressIndex;
  List<List<Map<String, dynamic>>> _ordersHistory;
  List<Map<String, dynamic>> _currentOrdersList;

  UserObjectInterface(this._username,this._hashedPassword,this._phoneNumber);

  get locations => _locations;

  get widgetNumber => _widgetNumber;

  get mainAddressIndex => _mainAddressIndex;

  void setMainAddress(int index){}

  void changingWidget(){}

  void addingNewLocationAndChangingTheWidget(Map newAddress,bool isItMain){}

  void addingToCart(Map<String, String> newOrder){}

  void validation(){}

  double currentOrdersPayCalculation(){
    return 0.00;
  }

  void forcingNotification(){}
}