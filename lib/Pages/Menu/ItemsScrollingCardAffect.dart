import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsScrollingCardEffect extends StatefulWidget{
  ItemsScrollingCardEffect({Key key,
    @required this.items,
    this.distanceBetweenWidgets,
    this.scaleOfUnselectedItems,
    this.shadowDepth
  }) : super (key: key);

  // ARRAY OF ITEMS TO BE SHOWN
  final List<Widget> items;

  final double distanceBetweenWidgets;
  final double scaleOfUnselectedItems;

  // USUALLY IS SET TO 6
  final double shadowDepth;

  ItemsScrollingCardEffectState createState() => ItemsScrollingCardEffectState();
}

class ItemsScrollingCardEffectState extends State<ItemsScrollingCardEffect>{

  int _indexOfItems = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // card height
      child: PageView.builder(
        itemCount: widget.items.length,
        controller: PageController(viewportFraction: widget.distanceBetweenWidgets),
        onPageChanged: (int index) => setState(() => _indexOfItems = index),
        itemBuilder: (_, i) {
          return Transform.scale(
            scale: i == _indexOfItems ? 1.0 : widget.scaleOfUnselectedItems,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: widget.items[i],
            ),
          );
        },
      ),
    );
  }
}