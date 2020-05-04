import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_app/Pages/CartPage/ShoppingCartWidget.dart';
import 'package:pizza_app/Pages/Location/LocationCenterWidget.dart';
import 'package:pizza_app/Pages/Menu/MenuPage.dart';
import 'package:pizza_app/Widgets/BottomNavigation/BottomNavigationWidget.dart';
import 'package:pizza_app/Widgets/BottomNavigation/NavigationStateObject.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget{
  MainPage({Key key}) : super(key: key);

  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>{

  final navigationItemsInfo = [
    {
      "text": "بیشتر",
      "icon": Icons.more_horiz,
      "color": Colors.orange
    },
    {
      "text": "اطلاعات",
      "icon": Icons.notifications,
      "color": Colors.orange
    },
    {
      "text": "سبد خرید",
      "icon": Icons.shopping_cart,
      "color": Colors.orange
    },
    {
      "text": "آدرس من",
      "icon": Icons.location_on,
      "color": Colors.orange
    },
    {
      "text": "خانه",
      "icon": Icons.home,
      "color": Colors.orange
    }
  ];

  Widget _centerWidget(int value){
    switch(value){

      case 0:
        for (int i=0;i<5;i++){
          if(i==0){
            navigationItemsInfo[i]["color"] = Colors.red;
          }else{
            navigationItemsInfo[i]["color"] = Colors.orange;
          }
        }
        return Center(child: Text("Number1"),);
        break;

      case 1:
        for (int i=0;i<5;i++){
          if(i==1){
            navigationItemsInfo[i]["color"] = Colors.red;
          }else{
            navigationItemsInfo[i]["color"] = Colors.orange;
          }
        }
        return Center(child: Text("Number2"),);
        break;

      case 2:
        for (int i=0;i<5;i++){
          if(i==2){
            navigationItemsInfo[i]["color"] = Colors.red;
          }else{
            navigationItemsInfo[i]["color"] = Colors.orange;
          }
        }
        return ShoppingCartWidget();
        break;

      case 3:
        for (int i=0;i<5;i++){
          if(i==3){
            navigationItemsInfo[i]["color"] = Colors.red;
          }else{
            navigationItemsInfo[i]["color"] = Colors.orange;
          }
        }
        return LocationCenterWidget();
        break;

      case 4:
        for (int i=0;i<5;i++){
          if(i==4){
            navigationItemsInfo[i]["color"] = Colors.red;
          }else{
            navigationItemsInfo[i]["color"] = Colors.orange;
          }
        }
        return MenuMainWidget();
        break;

      default:
        return null;
        break;
    }
  }


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationStateObject()),
      ],
      child: MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(218, 37, 49, 1),
                  Color.fromRGBO(101, 27, 32, 1)
                ]
              )
            ),
            child: Column(
              children: <Widget>[
              Expanded(
                child: Container(
                  child: Consumer<NavigationStateObject>(
                    builder: (context,item,child){
                      return this._centerWidget(item.value);
                  }),
                ),
              ),
              BottomNavigationWidget(navigationInfo: navigationItemsInfo)
              ],
            )
          ),
        ),
      ),
    );
  }
}