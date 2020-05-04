import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_app/Pages/Location/AddingAddresses.dart';
import 'package:pizza_app/Pages/Location/ShowingAddresses.dart';
import 'package:pizza_app/UserObject.dart';
import 'package:pizza_app/Widgets/TitleInPage.dart';
import 'package:pizza_app/Widgets/TopCircleWidget.dart';
import 'package:provider/provider.dart';

class LocationCenterWidget extends StatefulWidget{
  LocationCenterWidget({Key key}) : super(key: key);

  LocationCenterWidgetState createState() => LocationCenterWidgetState();
}
class LocationCenterWidgetState extends State<LocationCenterWidget>{


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          child: Stack(
            children: [
              TopCircleWidget(height: -600,)
            ]
          )
        ),
        Container(
          margin: EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomRight,
                child: TitleInPage(
                  text: "موقعیت فعلی شما"
                )
              ),
              Container(
                height: MediaQuery.of(context).size.height/6,
                child: Center(
                  child: Text("sdasdads")
                ),
              ),
              Consumer<UserObject>(
                builder: (context,item,child){
                  if(item.widgetNumber == 0){
                    return AddressesWidgetShow();
                  }else{
                    return AddressAddingWidget();
                  }
                },
              ),
            ],
          ),
        ),
      ]
    );
  }
}





//ChangeNotifierProvider(
//create: (context) => UserObject(),
//child: Consumer<UserObject>(
//builder: (context,item,child){
//if(item.widgetNumber == 0){
//return AddressesWidgetShow();
//}else{
//return Container();
//}
//},
//),
//)