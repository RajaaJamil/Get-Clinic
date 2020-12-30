import 'package:flutter/material.dart';
import 'constant.dart';

class Cardinfo extends StatelessWidget {
  Cardinfo({this.icon, this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: KIconcolor),
        title: Text(
          title,
          style: KLabelTextStyle,
        ),
      ),
    );
  }
}
