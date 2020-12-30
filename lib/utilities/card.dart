import 'package:flutter/material.dart';
import 'package:clinic_app/Screens/listOfclinics.dart';
import 'constant.dart';

class Cardicon extends StatefulWidget {
  Cardicon({this.imageInfo,this.lable,this.special,this.icons});
  final imageInfo;
  final lable;
  final special;
  final icons;
  @override
  _CardiconState createState() => _CardiconState();
}

class _CardiconState extends State<Cardicon> {

  int special = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      child: Container(
        height: 100.0,
        width: 70.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
             widget.imageInfo,
              height: 50,
              width: 50,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
             widget.lable,
              style: KLabelTextStyle,
            )
          ],
        ),
        margin: EdgeInsets.all(15.0),
        decoration: Kspecialdecor,
      ),
      onTap: () {
        setState(() {
          special = widget.special;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListOFclinics(
                      special: special,
                      icons: widget.icons,
                    )));
      },
    ));
  }
}
