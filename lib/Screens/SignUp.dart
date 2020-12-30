import 'package:flutter/material.dart';
import 'package:clinic_app/utilities/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clinic_app/services/Network.dart';
import 'package:clinic_app/Screens/login.dart';

class New_account extends StatefulWidget {
  @override
  _New_accountState createState() => _New_accountState();
}

class _New_accountState extends State<New_account> {
  int sex = 1;

  void radioEvent(int Value) {
    setState(() {
      sex = Value;
    });
  }

  String name;
  String password;
  String password1;
  String age;

  Network network = Network();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F7375),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SvgPicture.asset(
              'images/back.svg',
              fit: BoxFit.fill,
              height: 1500,
              width: 3000,
            ),
            ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        child: Center(
                            child: Text(
                          'إنشاء حساب',
                          style: KTitel1TextStyle,
                        )),
                        height: 60.0,
                        margin: EdgeInsets.only(bottom: 15.0),
                        decoration: KBoxDecoration),
                    Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Color(0xFF0F7275)),
                      ),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 20.0),
                            child: TextFormField(
                              onChanged: (value) {
                                name = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'الرجاء تعبئة الحقل';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                filled: true,
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
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF0F7275), width: 2.0)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF0F7275), width: 2.0),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                password = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'الرجاء تعبئة الحقل';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'كلمة المرور',
                                hintStyle: TextStyle(fontFamily: 'Tajawal'),
                                hoverColor: Color(0xFF0F7275),
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF0F7275),
                                  size: 30.0,
                                ),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF0F7275), width: 2.0)),
                                focusColor: Color(0xFF0F7275),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF0F7275), width: 2.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 20.0),
                            child: TextFormField(
                              onChanged: (value) {
                                password1 = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'الرجاء تعبئة الحقل';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'تأكيد كلمة المرور',
                                hintStyle: TextStyle(fontFamily: 'Tajawal'),
                                hoverColor: Color(0xFF0F7275),
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF0F7275),
                                  size: 30.0,
                                ),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF0F7275), width: 2.0)),
                                focusColor: Color(0xFF0F7275),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF0F7275), width: 2.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                age = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'الرجاء تعبئة الحقل';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'العمر',
                                hintStyle: TextStyle(fontFamily: 'Tajawal'),
                                hoverColor: Color(0xFF0F7275),
                                icon: Icon(
                                  Icons.supervisor_account,
                                  color: Color(0xFF0F7275),
                                  size: 30.0,
                                ),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF0F7275), width: 2.0)),
                                focusColor: Color(0xFF0F7275),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF0F7275), width: 2.0)),
                              ),
                            ),
                          ),
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Icon(Icons.accessibility,
                                    size: 30, color: Color(0xFF0F7275)),
                              ),
                              Expanded(
                                flex: 2,
                                child: RadioListTile(
                                  value: 1,
                                  groupValue: sex,
                                  onChanged: radioEvent,
                                  title: Text(
                                    'ذكر',
                                    style: KLabelTextStyle,
                                  ),
                                  activeColor: Color(0xFF0F7275),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: RadioListTile(
                                  value: 2,
                                  groupValue: sex,
                                  onChanged: radioEvent,
                                  title:
                                      new Text('انثى', style: KLabelTextStyle),
                                  activeColor: Color(0xFF0F7275),
                                ),
                              ),
                            ],
                          ),
                          RaisedButton(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xFF0F7275))),
                            child: Text('حفظ', style: KbuttonStyle),
                            color: Color(0xFF0F7275),
                            onPressed: () async {
//                              Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) =>
//                                          Clinics_specialization()));
                              var result = await network.sendUserData1(name,
                                  password, password1, int.parse(age), sex);
                              print("ddd${result.runtimeType}");

                              switch (result['user']) {
                                case 1:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                  break;
                                case 2:
                                  print("i am in 3333333");
                                  await showDialog(
                                      context: context,
                                      builder: (_) {
                                        return Dialog(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          width: 5.0,
                                                          color: KIconcolor))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.error_outline,
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              6,
                                                      color: KIconcolor,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Text(
                                                        "اسم المستخدم أو كلمة المرور غير صحيحة",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Tajawal",
                                                            color: KIconcolor),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                  break;
                                case 3:
                                  await showDialog(
                                      context: context,
                                      builder: (_) {
                                        return Dialog(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          width: 2.0,
                                                          color: KIconcolor))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.error_outline,
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      color: KIconcolor,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Text(
                                                        " عذرا لم نستطع الاتصال تأكد من اتصالك بالانترنت وحاول مرة أخرى",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Tajawal",
                                                            color: KIconcolor),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                  break;
                              }
                            },
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
