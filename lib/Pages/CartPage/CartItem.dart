import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_app/Widgets/RowsForPaymentTextWidget.dart';


class CartItem extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color.fromRGBO(250, 250, 250, 0.2)
      ),
      margin: EdgeInsets.only(bottom: 10),
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Icon(Icons.local_pizza,size: 80),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: TextWidget(text:"پیتزا پپرونی",size: 20,color: Colors.white),
                  alignment: Alignment.centerRight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextWidget(text:"۱۸۹۰۰ تومان",size: 20,color: Colors.white,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove_circle,size: 30,color: Colors.orange,),
                          ),
                          Text("one"),
                          IconButton(
                            icon: Icon(Icons.add_circle,size: 30,color: Colors.green,),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_forever,size: 35,color: Colors.red,),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}