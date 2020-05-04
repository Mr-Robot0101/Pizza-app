import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginInputs extends StatefulWidget{
  LoginInputs({Key key, this.cellPhoneController,this.passwordController}) : super(key: key);

  final TextEditingController cellPhoneController,passwordController;

  LoginInputsState createState() => LoginInputsState();
}

class LoginInputsState extends State<LoginInputs>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "شماره همراه",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'B-koodak'

                  ),
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white))),
                  controller: widget.cellPhoneController,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "رمز عبور",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'B-koodak'

                  ),
                ),
              ),
              Container(
                child: TextField(
                  enabled: true,
                  controller: widget.passwordController,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}