import 'package:flutter/material.dart';

const web = 'http://192.168.1.6:8080/project'; 
const KLabelTextStyle =
    TextStyle(fontSize: 16.0, color: Color(0xFF2A3D42), fontFamily: 'Tajawal');

const KTitel1TextStyle =
    TextStyle(fontSize: 22.0, color: Color(0xFF2A3D42), fontFamily: 'Almarai');
const KIconcolor = Color(0xFF0F7173);
const KBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)));
const KbuttonStyle = TextStyle(
  fontSize: 22.0,
  color: Colors.white,
  fontFamily: 'Tajawal',
  height: 2.0,
);
var Kinputdec = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  filled: true,
  errorStyle: TextStyle(fontFamily: 'Tajawal', fontSize: 10.0),
  fillColor: Colors.white,
  hintText: 'اسم المستخدم',
  hintStyle: TextStyle(fontFamily: 'Tajawal'),
  hoverColor: Color(0xFF0F7275),
  icon: Icon(
    Icons.account_circle,
    color: Color(0xFF0F7275),
    size: 30.0,
  ),
  alignLabelWithHint: true,
  focusColor: Color(0xFF0F7275),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(color: Color(0xFF0F7275), width: 2.0)),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF0F7275), width: 2.0),
    borderRadius: BorderRadius.circular(30.0),
  ),
);
var Kspecialdecor = BoxDecoration(
    color: Colors.white, borderRadius: BorderRadius.circular(10.0));
