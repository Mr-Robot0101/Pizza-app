import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget{
  TextWidget({Key key,@required this.text,this.size,this.color}) : super (key: key);

  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return Text(
        this.text,
        style: TextStyle(
          color:color,
          fontWeight: FontWeight.bold,
          fontSize: size,
        )
    );
  }
}