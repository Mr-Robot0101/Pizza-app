import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Pages/Login/LoginButt.dart';
import 'package:pizza_app/Pages/Login/LoginInputWidgets.dart';
import 'package:pizza_app/Widgets/Routing1.dart';
import 'package:pizza_app/Pages/SignUp/SignupPage.dart';

class LoginPage extends StatefulWidget{
  LoginPage({Key key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{

  Animation<double> _picOpacity,_picTopPosition,_whiteSpaceScaling,_widgetsOpacity;
  AnimationController _mainController;

  final _passController = TextEditingController();
  final _phoneController = TextEditingController();

  Future<void> _loggingin(){
    if(_phoneController.text == "user"){
      Navigator.pushReplacementNamed(context, '/mainPage');
    }else{
      return showDialog(context: context,builder:(context){
        return AlertDialog(
          title: Text("Error"),
          actions: <Widget>[
            FlatButton(
              child: Text("Done"),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      });
    }
  }

  @override
  void initState(){
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5)
    );

    _picOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: Interval(
          0.0, 0.4,
          curve: Curves.easeIn
        )
      )
    );
    _widgetsOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: Interval(
          0.9,1.0,
          curve: Curves.easeInCubic
        )
      )
    );
    _whiteSpaceScaling = Tween<double>(
        begin: 110.0,
        end: 35.0
    ).animate(
        CurvedAnimation(
            parent: _mainController,
            curve: Interval(
                0.4, 0.8,
                curve: Curves.easeInOutCirc
            )
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    _picTopPosition = Tween<double>(
        begin: (MediaQuery.of(context).size.height/9) * 3,
        end: (MediaQuery.of(context).size.height/9) * 1 -40
    ).animate(
        CurvedAnimation(
            parent: _mainController,
            curve: Interval(
                0.4, 0.8,
                curve: Curves.easeInOutQuint
            )
        )
    );
    _mainController.forward();
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        body:
          AnimatedBuilder(
            animation: _mainController.view,
            builder:(context, _) {
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(218, 37, 49, 1),
                          Color.fromRGBO(101, 27, 32, 1)
                        ]
                    )
                ),
                child: Stack(
                    children: [
                      Positioned(
                        top: -10,
                        left: (MediaQuery.of(context).size.width/10) *4.8,
                        child: Transform.scale(
                          scale: _whiteSpaceScaling.value,
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
                        top: _picTopPosition.value,
                        left: (MediaQuery.of(context).size.width/10) *2.7,
                        child: Opacity(
                          opacity: _picOpacity.value,
                          child: Container(
                            child: Image.asset('lib/srcs/chef-image.png'),
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ),
                      Positioned(
                        top: (MediaQuery.of(context).size.height/9) * 3.5,
                        left: (MediaQuery.of(context).size.width/10) *2.5,
                        child: Opacity(
                          opacity: _widgetsOpacity.value,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(2, 5),
                                  blurRadius: 10,
                                  spreadRadius : 0.0
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
                      ),

                      Opacity(
                        opacity: _widgetsOpacity.value,
                        child: Container(
                          padding: EdgeInsets.only(left: 80,right: 80,top: 320),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  LoginInputs(cellPhoneController: _phoneController,passwordController: _passController),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      "رمز عبور را فراموش کرده ام",
                                      style: TextStyle(
                                          color: Colors.amberAccent,
                                          fontSize: 10
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 25),
                                    child: LoginBut(
                                      "ورود",
                                      Colors.white,
                                      BorderRadius.only(
                                        bottomLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0)),
                                        () {
                                          _loggingin();
                                      }
                                    )
                                  ),
                                  Container(
                                      child: LoginBut(
                                          "عضويت",
                                          Color.fromRGBO(242, 176, 43, 1),
                                          BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              bottomRight: Radius.circular(
                                                  20.0)),
                                              () {
                                            Navigator.push(
                                              context,
                                              MyCustomRoute(
                                                builder: (context) =>
                                                  SignupWidget()),
                                    );
                                  }
                                )
                              ),
                            ],
                          ),
                        ],

                      ),
                    ),
                  ),
                ]
              ),
            );
          }
        ),
      ),
    );
  }
}