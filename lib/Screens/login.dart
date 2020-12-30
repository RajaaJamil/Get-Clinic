import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'package:clinic_app/Screens/clinics specialization.dart';
import 'package:clinic_app/utilities/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clinic_app/services/Network.dart';
import 'package:clinic_app/services/local_data.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  void initState() {
    getUser().then((value) {
      print("User is $value");
      if (value!= null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Clinics_specialization()));
      }
    });

    super.initState();
  }

  @override
  var name;
  var password;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;
  final passwordFocusNode = FocusNode();
  final buttonFocusNode = FocusNode();
  Network network = Network();



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
                          'تسجيل دخول',
                          style: KTitel1TextStyle,
                        )),
                        height: 60.0,
                        margin: EdgeInsets.only(bottom: 15.0),
                        decoration: KBoxDecoration),
                    Container(
                        child: SvgPicture.asset(
                      'images/Group12.svg',
                      height: 150,
                    )),
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
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context)
                                      .requestFocus(passwordFocusNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'الرجاء تعبئة الحقل';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  name = value;
                                },
                                decoration: Kinputdec),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: TextFormField(
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(buttonFocusNode);
                              },
                              onChanged: (value) {
                                password = value;
                              },
                              obscureText: true,
                              focusNode: passwordFocusNode,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'كلمة المرور',
                                hintStyle: TextStyle(fontFamily: 'Tajawal'),
                                errorStyle: TextStyle(
                                    fontFamily: 'Tajawal', fontSize: 10.0),
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
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'الرجاء تعبئة الحقل';
                                }

                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xFF0F7275))),
                              child: Text('دخول', style: KbuttonStyle),
                              color: Color(0xFF0F7275),
                              onPressed: () async {
                                var result =
                                    await network.sendUserData(name, password);

                                if (result['user'] != 2 &&
                                    result['user'] != 3) {
                                  saveUser(result["user"]);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Clinics_specialization()));
                                }
                                print("result is $result");
                                switch (result['user']) {
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
                                                            color:
                                                                KIconcolor))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.error_outline,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            6,
                                                        color: KIconcolor,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Text(
                                                          "اسم المستخدم أو كلمة المرور غير صحيحة",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Tajawal",
                                                              color:
                                                                  KIconcolor),
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
                                                            color:
                                                                KIconcolor))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.error_outline,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        color: KIconcolor,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Text(
                                                          " عذرا لم نستطع الاتصال تأكد من اتصالك بالانترنت وحاول مرة أخرى",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Tajawal",
                                                              color:
                                                                  KIconcolor),
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
                          ),
                          RaisedButton(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xFF0F7275))),
                            child: Text(
                              'إنشاء حساب',
                              style: TextStyle(
                                  color: Color(0xFF0F7275),
                                  fontSize: 20.0,
                                  height: 2.5,
                                  fontFamily: 'Tajawal'),
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => New_account()));
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
