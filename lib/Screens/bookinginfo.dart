import 'package:flutter/material.dart';
import 'package:clinic_app/utilities/constant.dart';
import 'package:clinic_app/services/Network.dart';
import 'package:clinic_app/services/local_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'clinics specialization.dart';

class BookingInfo extends StatefulWidget {
  BookingInfo({this.id});
  final id;
  @override
  _BookingInfoState createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  int sex = 1;
  String name;
  String age;
  String dropdownValue;
  String userId;
  TextEditingController mycontroler = TextEditingController();
  TextEditingController mycontroler1 = TextEditingController();

  Network network = Network();

  void radioEvent(int Value) {
    setState(() {
      sex = Value;
    });
  }

  var data;
  Future<dynamic> getdata() async {
    var temp;
    var w = int.parse(userId);
    temp = await network.get_await_num(widget.id);
    return temp;
    //print(data);
  }

  @override
  void initState() {
    getUser().then((value) {
      print("User is $value");
      userId = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0F7375),
        body: SafeArea(
            child: Stack(children: <Widget>[
          SvgPicture.asset(
            'images/back.svg',
            fit: BoxFit.fill,
            height: 1500,
            width: 3000,
          ),
          ListView(
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        child: Center(
                            child: Text(
                          'بيانات الحجز',
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
                        child: Column(children: <Widget>[
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
                              controller: mycontroler,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "اسم المريض",
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
                                age = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'الرجاء تعبئة الحقل';
                                }
                                return null;
                              },
                              controller: mycontroler1,
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "عمر المريض",
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
                                  title: Text('ذكر', style: KLabelTextStyle),
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
                          Container(
                            margin: EdgeInsets.only(right: 15.0),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
//                            decoration: BoxDecoration(
//                                color: Color(0xFF0F7375),
//                                borderRadius: BorderRadius.circular(20.0)
//                            ),
                            child: DropdownButton<String>(
                              hint: Text("قم باختيار الفترة",
                                  style: KLabelTextStyle),
                              isExpanded: true,
                              value: dropdownValue,
                              icon: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Color(0xFF0F7375),
                                ),
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.white),
                              underline: Container(
                                height: 2,
                                color: Colors.white,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'الفترة المسائيه',
                                'الفترة الصباحيه'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(
                                      child: Text(
                                    value,
                                    style: KLabelTextStyle,
                                  )),
                                );
                              }).toList(),
                            ),
                          ),
                          RaisedButton(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xFF0F7275))),
                            child: Text('حفظ', style: KbuttonStyle),
                            color: Color(0xFF0F7275),
                            onPressed: () async {

                              getdata().then((value) async {
                                print("awaiting returns ${value}");
                                dynamic awaitingNumData = value;

                                network
                                    .sendbookingData(
                                        name,
                                        dropdownValue,
                                        widget.id,
                                        int.parse(userId),
                                        widget.id,
                                        int.parse(age),
                                        sex)
                                    .then((value) async {
                                  print("clinic id ${widget.id}");
                                  print(" MAX DATA IS $value");
                                  if (value["user"] == 1) {
                                    await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                    style: TextStyle(
                                                      fontSize: 40,
                                                      color: KIconcolor,
                                                    ),
                                                  ),
                                                  Text('رقم الانتظار',
                                                      style: TextStyle(
                                                          color: KIconcolor,
                                                          fontFamily:
                                                              'Tajawal')),
                                                  Text(
                                                    awaitingNumData[0]['max'],
                                                    style: TextStyle(
                                                        color: KIconcolor,
                                                        fontFamily: 'Tajawal'),
                                                  )
                                                ]),
                                            actions: <Widget>[
                                              FlatButton(
                                                  child: Text(
                                                    'عودة',
                                                    style: TextStyle(
                                                        color: KIconcolor,
                                                        fontFamily: 'Tajawal'),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Clinics_specialization()));
                                                  }),
                                            ],
                                          );
                                        });
                                  } else if (value["user"] == 2) {
                                    await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.close,
                                                    size: 30,
                                                    color: KIconcolor,
                                                  ),
                                                  Text(
                                                    'عذرا',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 40,
                                                      color: KIconcolor,
                                                    ),
                                                  ),
                                                  Text(
                                                      "عذرا انتهت حجوزات هذا اليوم بامكانك المحاولة غدا",
                                                      style: TextStyle(
                                                          color: KIconcolor,
                                                          fontFamily:
                                                              'Tajawal'))
                                                ]),
                                            actions: <Widget>[
                                              FlatButton(
                                                  child: Text(
                                                    'عودة',
                                                    style: TextStyle(
                                                        color: KIconcolor,
                                                        fontFamily: 'Tajawal'),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Clinics_specialization()));
                                                  }),
                                            ],
                                          );
                                        });
                                  }
                                });
                                mycontroler.text = '';
                                mycontroler1.text = '';
                                data = value;

                                print("data is $data");
                              });
                            },
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        ]))
                  ])
            ],
          )
        ])));
  }
}
