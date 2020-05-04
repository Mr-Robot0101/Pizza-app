import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AddressWidget extends StatelessWidget{
  AddressWidget({Key key,this.newAddress}): super(key: key);

  final Map<String,String> newAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.white30.withOpacity(0.2),borderRadius: BorderRadius.circular(10.0)),
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            // Top container
            margin: EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Icons row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.restore_from_trash
                      )
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.edit
                      )
                    )
                  ],
                ),
                // Home widget container
                Container(
                  margin: EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  child: Text(this.newAddress["title"]),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.greenAccent),
                  width: 60,
                  height: 20,
                )
              ],
            ),
          ),
          // Middle container
          Container(
            child: Text(this.newAddress["address"]),
            margin: EdgeInsets.only(bottom: 5.0,right: 10),
            alignment: Alignment.centerRight,
          ),
          // Bottom container
          Container(
            padding: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.white)
                )
            ),
            child: Text("Sdasd"),
            margin: EdgeInsets.only(bottom: 5.0,right: 10, left: 10),
            alignment: Alignment.centerRight,
          )
        ],
      ),
    );
  }
}