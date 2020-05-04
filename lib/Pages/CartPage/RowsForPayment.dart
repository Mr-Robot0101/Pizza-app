import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Widgets/RowsForPaymentTextWidget.dart';

class RowsForPayment extends StatelessWidget{

  RowsForPayment({Key key,this.leftText,this.rightText,this.size,this.color}) : super(key: key);

  final String rightText,leftText;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: Colors.white))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextWidget(text: leftText,size: size,color: color,),
          TextWidget(text: rightText,size: size,color: color,)
        ],
      ),
    );
  }

}