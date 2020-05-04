import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pizza_app/Widgets/RowsForPaymentTextWidget.dart';

class AddressAdderColumn extends StatelessWidget{
  AddressAdderColumn({Key key,this.title,this.placeHolder,this.node,this.nextNode,this.controller}) : super(key: key);

  final String title,placeHolder;
  final FocusNode node,nextNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: TextWidget(
              text: this.title,
              color: Colors.white,
              size: 13,
            ),
          ),
          Container(
            child: TextFormField(
              controller: controller,
              focusNode: this.node,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: this.placeHolder,
                hintStyle: TextStyle(color: Colors.white.withAlpha(130)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
              ),
              textDirection: TextDirection.rtl,
              onEditingComplete: (){
                FocusScope.of(context).requestFocus(this.nextNode);
              },

            ),
          )
        ],
      ),
    );
  }
}