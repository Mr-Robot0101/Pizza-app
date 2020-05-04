import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_app/Pages/Menu/ItemsScrollingCardAffect.dart';
import 'package:pizza_app/Widgets/RowsForPaymentTextWidget.dart';
import 'package:pizza_app/Widgets/TopCircleWidget.dart';

class MenuMainWidget extends StatefulWidget{

  @override
  _MenuMainWidgetState createState() => _MenuMainWidgetState();
}

class _MenuMainWidgetState extends State<MenuMainWidget> with TickerProviderStateMixin {

  final List<Icon> _foods = [Icon(Icons.local_pizza),Icon(Icons.fastfood)];

  final List<Image> _hamburgers = [
    Image.asset('srcs/pizza-pics/burger.png'),
    Image.asset('srcs/pizza-pics/burger.png'),
    Image.asset('srcs/pizza-pics/burger.png'),
    Image.asset('srcs/pizza-pics/burger.png'),
    Image.asset('srcs/pizza-pics/burger.png')
  ];


  final List<Icon> _kindsOfPizza = [
    Icon(Icons.fastfood),
    Icon(Icons.local_pizza),
    Icon(Icons.local_pizza),
    Icon(Icons.fastfood)
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 5,
            bottom: 10,
            child: Container(
              height: 240,
              width: width-10,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25.0)
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Image.asset("srcs/TopRightImage.png"),
                        width: width/2 - 10,
                      ),
                      Container(
                        child: Image.asset('srcs/TopLeftImage.png'),
                        width: width/2 - 10,
                      )
                    ],
                  ),
                  Container(
                    child: Image.asset('srcs/BottomImage.png'),
                    width: width,
                  )
                ],
              ),
            ),
          ),

          // CIRCLE BENEATH ALL
          Transform.scale(
            scale: 7.0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle
              ),
              child: Text("Second One"),
              height: 100,
              alignment: Alignment.centerLeft,
            ),
          ),

          // ITEMS
          Transform.translate(
            offset: Offset(0,MediaQuery.of(context).size.height/3),
            child: ItemsScrollingCardEffect(
              items: _hamburgers,
              distanceBetweenWidgets: 0.35,
              scaleOfUnselectedItems: 0.7,
              shadowDepth: 6,
            )
          ),

          // UPPER CIRCLE
          Transform.translate(
            offset: Offset(0,-230),
            child: Transform.scale(
              scale: 3.6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle
                ),
                child: Text("Second One"),
                height: 200,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(0,-230),
              child: ItemsScrollingCardEffect(
                items: _hamburgers,
                distanceBetweenWidgets: 0.35,
                scaleOfUnselectedItems: 0.7,
                shadowDepth: 6,
              )
          ),
          TopCircleWidget(height: -620),
          Positioned(
            top: 20,
            right: width/2.5,
            child: TextWidget(text: "خوش آمدید",size: 18,color: Colors.white,)
          )
        ],
      ),
    );
  }
}