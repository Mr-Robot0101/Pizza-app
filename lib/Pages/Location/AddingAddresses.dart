import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pizza_app/Pages/Location/AddressAdderColumn.dart';
import 'package:pizza_app/Widgets/RowsForPaymentTextWidget.dart';
import 'package:provider/provider.dart';

import '../../UserObject.dart';

enum SingingCharacter { lafayette, jefferson }

class AddressAddingWidget extends StatefulWidget{
  AddressAddingWidget({Key key}) : super(key: key);

  AddressAddingWidgetState createState() => AddressAddingWidgetState();
}
class AddressAddingWidgetState extends State<AddressAddingWidget>{

  SingingCharacter _character = SingingCharacter.lafayette;

  final FocusNode nodeOne = FocusNode();
  final FocusNode nodeTwo = FocusNode();
  final FocusNode nodeThree = FocusNode();
  final FocusNode nodeFour = FocusNode();
  final TextEditingController
      controller1 = TextEditingController(),
      controller2 = TextEditingController(),
      controller3 = TextEditingController(),
      controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height/2.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white30.withAlpha(30),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: ListView(
        children: <Widget>[
          AddressAdderColumn(
            controller: controller1,
            title:"address",
            placeHolder: "(خانه-محل کار-منزل عمو...)",
            node: nodeOne,
            nextNode: nodeTwo,
          ),
          AddressAdderColumn(
            controller: controller2,
            title: "city",
            placeHolder: "نقده",
            node: nodeTwo,
            nextNode: nodeThree,
          ),
          AddressAdderColumn(
            controller: controller3,
            title: "district",
            placeHolder: "منطقه",
            node: nodeThree,
            nextNode: nodeFour,
          ),
          AddressAdderColumn(
            controller: controller4,
            title: "exact address",
            placeHolder: "شهر-منطقه-خیابان...",
            node: nodeFour,
          ),

          Container(
            alignment: Alignment.bottomRight,
            child: Row(
              children: <Widget>[
                Container(
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                      child: TextWidget(
                        text: "تایید",
                        color: Colors.white,
                        size: 15
                      )
                    ),
                    onTap: (){
                      Map<String,String> address = {
                        "title": controller1.value.text,
                        "address": controller2.value.text + " " + controller3.value.text + " "
                        + controller4.value.text ,
                        "main": "false"
                      };
                      Provider.of<UserObject>(context).addingNewLocationAndChangingTheWidget(address, true);
                      print(Provider.of<UserObject>(context).locations);
                    },
                  ),
                ),
                Container(
                  child: Radio(
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}