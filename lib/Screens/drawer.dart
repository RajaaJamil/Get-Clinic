import 'package:flutter/material.dart';
import 'package:clinic_app/Screens/clinics specialization.dart';
import 'package:clinic_app/utilities/constant.dart';
import 'favorits.dart';
import 'package:clinic_app/Screens/Contactus.dart';
import 'viewMap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clinic_app/services/local_data.dart';
import 'package:clinic_app/Screens/login.dart';


class Drawerofitem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color selected=Color(0xFF0F7275);
    return Drawer(
      child: ListView(children: <Widget>[
        SizedBox(
          child: SvgPicture.asset(
            'images/Group12.svg',
            height: 60,
          ),
          //height: 60,
        ),
        Container(
          color: selected,
          child: ListTile(
            leading: Icon(Icons.home, color: Color(0xFF2A3D42)),
            title: Text(
              'الصفحة الرئيسية',
              style: KLabelTextStyle,
            ),
            onTap: () {
              selected=Color(0xFF0F7275);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Clinics_specialization()));
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.favorite, color: Color(0xFF2A3D42)),
          title: Text('المفضلة', style: KLabelTextStyle),
          onTap: () {
            selected=Color(0xFF0F7275);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Favorits()));
          },
        ),
        ListTile(
          leading: Icon(Icons.location_on, color: Color(0xFF2A3D42)),
          title: Text('العيادات القريبة منك', style: KLabelTextStyle),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ViewMap()));
          },
        ),
        ListTile(
          leading: Icon(Icons.comment, color: Color(0xFF2A3D42)),
          title: Text(
            'تواصل معنا',
            style: KLabelTextStyle,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Contact()));
          },
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Color(0xFF2A3D42)),
          title: Text(
            'تسجيل خروج',
            style: KLabelTextStyle,
          ),
          onTap: () {
            deleteUser().then((value){

              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                return Login();
              }), (Route<dynamic> route) => false );
            });

          },
        ),
      ]),
    );
  }
}
