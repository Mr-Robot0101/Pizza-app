import 'package:flutter/material.dart';

class TitleInPage extends StatelessWidget{
  TitleInPage({Key key,this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),
    );
  }
}