import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pizza_app/Pages/CartPage/MainAddressForCartPage.dart';
import 'package:pizza_app/Pages/CartPage/ShoppingCenterWidget.dart';
import 'package:pizza_app/UserObject.dart';
import 'package:provider/provider.dart';

class ShoppingCartWidget extends StatefulWidget{
  ShoppingCartWidget({Key key}) : super(key: key);

  ShoppingCartWidgetState createState() => ShoppingCartWidgetState();
}
class ShoppingCartWidgetState extends State<ShoppingCartWidget> with SingleTickerProviderStateMixin{
  Animation<double> _topCircleHeight, _centerWidgetOpacity;
  Animation<double> _centerWidgetAbsorbing;
  Animation<Offset> _iconTranslationAnimation;
  Animation<double> _iconAnimation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    );
    _iconTranslationAnimation = Tween<Offset>(
      begin: Offset(0.0,0.0),
      end: Offset(0.0,4.0)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeInOut
        ),
        reverseCurve: Curves.easeInOut
      )
    );
    _topCircleHeight = Tween<double>(
      begin: -550.0,
      end: -150.0
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeInOut
        ),
        reverseCurve: Curves.easeInOut
      )
    );
    _centerWidgetOpacity = Tween<double>(
      begin: 1.0,
      end: 0.0
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.3,
          0.6,
          curve: Curves.easeInOut
        ),
        reverseCurve: Curves.easeInOut
      )
    );
    _centerWidgetAbsorbing = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          1.0,
          1.0,
          curve: Curves.easeInOut
        ),
        reverseCurve: Curves.easeInOut
      )
    );
    _iconAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          1.0,
          1.0,
          curve: Curves.easeInOut
        ),
        reverseCurve: Curves.easeInOut
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  int place = 0;

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _controller,
      builder: (context,child){
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height-60,
          child: Stack(
            children: <Widget>[
              //CENTER WIDGET
              Positioned(
                top: 180,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-100,
                  child: AbsorbPointer(
                    absorbing: _centerWidgetAbsorbing.value == 1 ? true : false,
                    child: Opacity(
                        opacity: _centerWidgetOpacity.value,
                        child: ShoppingCenterWidget()
                    ),
                  ),
                ),
              ),
              //TOP CIRCLE WIDGET
              Positioned(
                child: Container(
                  height: 150,
                  child: Transform.translate(
                    offset: Offset(0,_topCircleHeight.value),
                    child: Transform.scale(
                      scale: 8,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //TOP ROW WIDGET (ICONBUTTON AND MAIN ADDRESS)
              Positioned(
                top: 20,
                left: 0,
                child: SlideTransition(
                  position: _iconTranslationAnimation,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width * (2/10),
                          child: InkWell(
                            onTap: () {
                              switch (_controller.status) {
                                case AnimationStatus.completed:
                                  _controller.reverse();
                                  break;
                                case AnimationStatus.dismissed:
                                  _controller.forward();
                                  break;
                                default:
                                  break;
                              }
                            },
                            child:
                              _iconAnimation.value == 1 ?
                                Icon(Icons.keyboard_arrow_up,color: Colors.white,) :
                                Icon(Icons.edit,color: Colors.white,),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * (8/10),
                          height: 200,
                          child: MainAddress()
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //ADDRESSES LISTVIEW
              Positioned(
                top: _topCircleHeight.value + 250 ,
                left: MediaQuery.of(context).size.width/6.3,
                child: Consumer<UserObject>(
                  builder: (context,item,child){
                    return Container(
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: ListView.builder(
                        itemCount: item.locations.length,
                        itemBuilder: (context,count){
                          if (count == item.mainAddressIndex){
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 5,color: Colors.blue),
                                borderRadius: BorderRadius.circular(25.0)
                              ),
                              child: GestureDetector(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(item.locations[count]["title"]),
                                    Text(item.locations[count]["address"]),
                                  ],
                                ),
                                onTap: (){},
                              ),
                            );
                          }else{
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0)
                              ),
                              child: GestureDetector(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(item.locations[count]["title"]),
                                    Text(item.locations[count]["address"]),
                                  ],
                                ),
                                onTap: (){
                                  item.setMainAddress(count);
                                },
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}