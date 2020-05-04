import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Widgets/BottomNavigation/NavigationStateObject.dart';
import 'package:pizza_app/Widgets/RowsForPaymentTextWidget.dart';
import 'package:provider/provider.dart';

class BottomNavigationItem extends StatefulWidget{
  BottomNavigationItem({Key key,this.text,this.icon,this.number,this.color}) : super(key: key);

  final String text;
  final icon;
  final int number;
  final Color color;

  BottomNavigationItemState createState() => BottomNavigationItemState();
}

class BottomNavigationItemState extends State<BottomNavigationItem>{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<NavigationStateObject>(context, listen: false).doit(widget.number);
        Provider.of<NavigationStateObject>(context, listen: false).setting(Colors.red);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<NavigationStateObject>(
            builder: (context,item,child){
              return Container(
                child: Icon(
                    widget.icon,
                    color: Colors.white
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: widget.color
                ),
                width: 35,
                height: 35,
              );
            } ,
          ),
          Container(
            child: TextWidget(text:widget.text,color: Colors.white,size: 12)
            )
        ]
      )
    );
  }
}