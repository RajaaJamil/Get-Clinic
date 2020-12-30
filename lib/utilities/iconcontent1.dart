import 'package:flutter/material.dart';
import 'package:clinic_app/utilities/constant.dart';

class Iconcontent1 extends StatelessWidget {
  Iconcontent1({
    this.icon,
    this.lable,
  });
  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: KIconcolor),
        Text(
          lable,
          style: KLabelTextStyle,
        )
      ],
    );
  }
}
