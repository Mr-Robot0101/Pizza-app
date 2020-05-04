import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Widgets/TitleInPage.dart';
import 'package:provider/provider.dart';

import '../../UserObject.dart';

class AddressAddingRow extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white30.withOpacity(0.2),
      ),
      child: Container(
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.white)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.add, size: 32),
                  color: Colors.white,
                  onPressed: () {
                    Provider.of<UserObject>(context).changingWidget();
                  },
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green
              ),
            ),
            Container(
              child: TitleInPage(text: "افزودن آدرس جدید"),
              margin: EdgeInsets.only(right: 10.0),
            )
          ],
        ),
      ),
    );;
  }
}