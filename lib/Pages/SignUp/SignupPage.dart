import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Pages/Login/LoginButt.dart';
import 'package:pizza_app/Widgets/Routing1.dart';
import 'package:pizza_app/Pages/SignUp/Signup2Page.dart';

class SignupWidget extends StatefulWidget{
  SignupWidget({Key key}) : super(key: key);


  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget>{

  @override
  Widget build(BuildContext context) {

    final width = (MediaQuery.of(context).size.width/10);
    final height = (MediaQuery.of(context).size.height/9);

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        body:
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromRGBO(218, 37, 49, 1),Color.fromRGBO(101, 27, 32, 1)]
                )
            ),
          child: Stack(
              children: [
                Positioned(
                  top: -10,
                  left: width * 4.8,
                  child: Transform.scale(
                    scale: 35.0,
                    child: Container(
                      child: Text(
                        "sc",
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 1 -40,
                  left: width * 2.7,
                  child: Container(
                    child: Image.asset('lib/srcs/chef-image.png'),
                    width: 200,
                    height: 200,
                  ),
                ),
                Positioned(
                  top: height * 3.5,
                  left: width *2.5,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(2, 5),
                          blurRadius: 10,
                          spreadRadius: 0.0
                      )
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Fast Mood",
                      style: TextStyle(
                        fontFamily: 'Showcard-Gothic',
                        fontSize: 38,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 80,right: 80,top: 320),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
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
                                          color: Colors.white
                                        )
                                      )
                                    ),
                                    onChanged: (value) {
                                      //                              email = value;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 15),
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
                                    onChanged: (value) {
                                      //                              pass = value;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 19),
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
                                    onChanged: (value) {

                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                          child: LoginBut(
                              "عضويت",
                              Color.fromRGBO(242, 176, 43, 1),
                              BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(
                                  20.0
                                )
                              ),
                              () {
                                Navigator.push(
                                  context,
                                  MyCustomRoute(
                                      builder: (context) =>
                                          Signup2Widget()),
                                );
                              }
                          )),
                    ],

                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}