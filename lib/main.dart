import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:clinic_app/Screens/clinics specialization.dart';
import 'package:clinic_app/Screens/login.dart';
import 'package:clinic_app/services/local_data.dart';


void main() => runApp(clinic());

class clinic extends StatefulWidget {
  @override
  _clinicState createState() => _clinicState();
}

class _clinicState extends State<clinic> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("ar")],
      title: 'cince',
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
