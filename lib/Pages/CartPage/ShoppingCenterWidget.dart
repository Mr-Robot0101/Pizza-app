import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_app/Pages/CartPage/CartCalculationWidget.dart';
import 'package:pizza_app/Pages/CartPage/CartItem.dart';
import 'package:pizza_app/Widgets/RowsForPaymentTextWidget.dart';

class ShoppingCenterWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: TextWidget(text: "سبد خرید شما",size: 18,color: Colors.white,),
          ),
          Container(
            margin: EdgeInsets.only(top: 5,bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: height/2.8,
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,child){
                return CartItem();
              }
            ),
          ),
          CartCalculationWidget()
        ],
      ),
    );
  }
}
