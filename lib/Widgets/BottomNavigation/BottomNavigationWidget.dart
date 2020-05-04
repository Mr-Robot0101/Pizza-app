import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Widgets/BottomNavigation/NavigationStateObject.dart';
import 'package:provider/provider.dart';

import 'BottomNavigationItem.dart';

class BottomNavigationWidget extends StatefulWidget{
  BottomNavigationWidget({Key key,this.navigationInfo}) : super(key: key);

  final List<Map> navigationInfo;

  BottomNavigationWidgetState createState() => BottomNavigationWidgetState();
}
class BottomNavigationWidgetState extends State<BottomNavigationWidget>{

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,count){
              return Consumer<NavigationStateObject>(
                builder:(context,item,child){ return Container(
                    width: MediaQuery.of(context).size.width/5,
                    child: BottomNavigationItem(
                      text: widget.navigationInfo[count]["text"],
                      icon: widget.navigationInfo[count]["icon"],
                      number: count,
                      color: widget.navigationInfo[count]["color"],
                    )
                  );
                },
              );
            }
        )
    );
  }
}