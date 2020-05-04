import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopCircleWidget extends StatelessWidget{
  TopCircleWidget({Key key,this.height,this.color});

  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: this.height,
      left: (MediaQuery.of(context).size.width/10) *4.8,
      child: Transform.scale(
        scale: 90.0,
        child: Container(
          child: Text(
            "sc",
            style: TextStyle(color: this.color),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red
          ),
        ),
      ),
    );
  }
}