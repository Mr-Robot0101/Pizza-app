import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Pages/Location/AddressWidget.dart';
import 'package:pizza_app/Pages/Location/AddressesLastWidget.dart';
import 'package:pizza_app/UserObject.dart';
import 'package:pizza_app/Widgets/TitleInPage.dart';
import 'package:provider/provider.dart';

class AddressesWidgetShow extends StatefulWidget{
  AddressesWidgetShow({Key key}) : super(key: key);

  AddressesWidgetShowState createState() => AddressesWidgetShowState();
}
class AddressesWidgetShowState extends State<AddressesWidgetShow>{

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomRight,
          child: TitleInPage(
              text: "آدرس های ذخیره شده"
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // THE MAIN CONTAINER
            // TODO Optimization needed
            Consumer<UserObject>(
              builder: (context,item,child) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: MediaQuery.of(context).size.height/2.3,
                  child: ListView.builder(
                    itemCount: item.locations.length + 1,
                    itemBuilder: (context, count) {
                      if (count != item.locations.length) {
                        return AddressWidget(
                          newAddress: item.locations[count],
                        );
                      } else {
                        return AddressAddingRow();
                      }
                    }
                  ),
                );
              }
            ),
          ],
        )
      ],
    );
  }
}