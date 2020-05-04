import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Pages/CartPage/RowsForPayment.dart';
import 'package:pizza_app/Widgets/RowsForPaymentTextWidget.dart';

class CartCalculationWidget extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: TextWidget(text: "خلاصه سبد کالا",size: 20,color: Colors.white)
          ),
          RowsForPayment(leftText: "۲ عدد",rightText: "  تعداد کالا" ,size: 12,color: Colors.white),
          RowsForPayment(leftText: "۰ تومان",rightText: "تخفبف" ,size: 12,color: Colors.red,),
          RowsForPayment(leftText: "۴۴۲۰۰ تومان",rightText: "جمع",size: 20,color: Colors.white,),
          Container(
            width: 180,
            alignment: Alignment.center,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0)
              ),
              child: TextWidget(text:"پرداخت",color: Colors.white,size: 18,),
              padding: EdgeInsets.symmetric(horizontal: 50),
              onPressed: (){},
              color: Colors.green,
            ),

          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Color.fromRGBO(250, 250, 250, 0.2)
      ),
    );
  }
}