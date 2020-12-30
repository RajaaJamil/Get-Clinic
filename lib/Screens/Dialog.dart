import 'package:flutter/material.dart';
import 'package:clinic_app/utilities/constant.dart';
import 'package:clinic_app/Screens/clinics specialization.dart';

class DialogInfo extends StatefulWidget {
  @override
  _DialogInfoState createState() => _DialogInfoState();
}

class _DialogInfoState extends State<DialogInfo> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              size: 80,
              color: KIconcolor,
            ),
            Text(
              'تم',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, color: KIconcolor,),
            ),
            Text(
              'رقم الأنتظار 5',
              style: TextStyle(color: KIconcolor,fontFamily:'Tajawal'),
            )
          ]),
      actions: <Widget>[
        FlatButton(
            child: Text(
              'عودة',
              style: TextStyle(color: KIconcolor,fontFamily:'Tajawal'),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Clinics_specialization()));;
            }),
      ],
    );
  }
}
