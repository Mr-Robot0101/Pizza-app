import 'package:flutter/material.dart';

class LoginBut extends StatefulWidget{
  LoginBut(this.title,this.color,this.borders,this.job);

  final title, color;
  final BorderRadius borders;
  final job;


  @override
  _LoginButState createState() => _LoginButState();
}

class _LoginButState extends State<LoginBut>{



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [BoxShadow(

          color: Colors.black.withOpacity(0.6),
          offset: Offset(2, 5),
          blurRadius: 10,
          spreadRadius: 0.0
      )]),
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        color: widget.color,
        shape: RoundedRectangleBorder(borderRadius: widget.borders),
        child: Text(
          widget.title,
          style: TextStyle(
            fontFamily: "Do-zar",
            fontSize: 25,
            fontWeight: FontWeight.bold

          ),
        ),
        onPressed: widget.job
      ),
    );
  }
}