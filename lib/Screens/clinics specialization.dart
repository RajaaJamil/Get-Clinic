import 'package:flutter/material.dart';
import 'package:clinic_app/utilities/card.dart';
import 'package:clinic_app/utilities/constant.dart';
import 'drawer.dart';
import 'package:clinic_app/services/local_data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Clinics_specialization extends StatefulWidget {
  @override
  _Clinics_specializationState createState() => _Clinics_specializationState();
}

class _Clinics_specializationState extends State<Clinics_specialization> {
  GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  int special = 0;
  var icons = [
    'images/png/018-heart.png',
    'images/png/017-tooth-1.png',
    'images/png/008-neuron-1.png',
    'images/png/015-eye.png',
    'images/png/009-backbone.png',
    'images/png/003-kidneys.png',
    'images/png/002-intestine.png',
    'images/png/005-dermis.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0F7375),
        key: _drawerkey,
        drawer: Drawerofitem(),
        body: SafeArea(
            child: Stack(children: <Widget>[
          SvgPicture.asset(
            'images/back.svg',
            fit: BoxFit.fill,
            height: 1500.0,
            width: 3000.0,
          ),
          ListView(children: <Widget>[
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                Widget>[
              Container(
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () => _drawerkey.currentState.openDrawer(),
                          child: Icon(
                            Icons.dehaze,
                          )),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 28)),
                      Text('العيادات', style: KTitel1TextStyle),
                    ],
                  ),
                  height: 60.0,
                  margin: EdgeInsets.only(bottom: 15.0),
                  decoration: KBoxDecoration),
              Row(
                children: <Widget>[
                  Cardicon(
                    imageInfo: icons[0],
                    lable: 'قلب',
                    special: 1,
                    icons: icons[0],
                  ),
                  Cardicon(
                    imageInfo: icons[1],
                    lable: 'أسنان',
                    special: 2,
                    icons: icons[1],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Cardicon(
                    imageInfo: icons[2],
                    lable: 'أعصاب',
                    special: 3,
                    icons: icons[2],
                  ),
                  Cardicon(
                    imageInfo: icons[3],
                    lable: 'عيون',
                    special: 4,
                    icons: icons[3],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Cardicon(
                    imageInfo: icons[4],
                    lable: 'العظام',
                    special: 5,
                    icons: icons[4]
                    ,
                  ),
                  Cardicon(
                    imageInfo: icons[5],
                    lable: 'مسالك بولية',
                    special: 6,
                    icons: icons[5],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Cardicon(
                    imageInfo: icons[6],
                    lable: 'باطنية',
                    special: 7,
                    icons: icons[6],
                  ),
                  Cardicon(
                    imageInfo: icons[7],
                    lable: 'جلد',
                    special: 8,
                    icons: icons[7],
                  ),
                ],
              ),
            ]),
          ])
        ])));
  }
}
