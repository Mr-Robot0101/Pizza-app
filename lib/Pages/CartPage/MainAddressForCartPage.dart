import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_app/Widgets/RowsForPaymentTextWidget.dart';
import 'package:provider/provider.dart';

import '../../UserObject.dart';

class MainAddress extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
      height: height/3.8,
      child: Provider.of<UserObject>(context).locations.length == 0 ? EmptyWidget() : MainAddressColumn()
    );
  }
}

class EmptyWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: TextWidget(text: "No Address",size: 20, color: Colors.white,),
    );
  }
}

class MainAddressColumn extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green
              ),
              child: TextWidget(
                text:Provider.of<UserObject>(context,listen: true)
                    .locations[
                Provider.of<UserObject>(context).mainAddressIndex
                ]["title"],
                size: 15,
                color: Colors.white,
              )
          ),
        ),
        Container(
            alignment: Alignment.centerRight,
            child: TextWidget(
              text: Provider.of<UserObject>(context,listen: true)
                  .locations[
              Provider.of<UserObject>(context).mainAddressIndex
              ]["address"],
              color: Colors.white,
              size: 16,
            )
        ),
        Container(
            alignment: Alignment.centerLeft,
            child: TextWidget(text: "زمان تقریبی ارسال سفارش ۲۰ دقیقه میباشد",color: Colors.orangeAccent,size: 14,)
        )
      ],
    );
  }
}