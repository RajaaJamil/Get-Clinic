import 'package:flutter/material.dart';
import 'package:clinic_app/utilities/constant.dart';
import 'package:clinic_app/utilities/iconcontent1.dart';
import 'package:clinic_app/utilities/Cardinfo.dart';
import 'package:clinic_app/Screens/bookinginfo.dart';
import 'package:clinic_app/services/Network.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clinic_app/services/local_data.dart';
import 'comment.dart';

class Clinic_Info extends StatefulWidget {
  Clinic_Info({this.id});
  final id;
  @override
  _Clinic_InfoState createState() => _Clinic_InfoState();
}

class _Clinic_InfoState extends State<Clinic_Info> {
  Network network = Network();
  Color aa = Colors.black;
  bool isEntered = false;
  List<bool> fav = [];
  String userId;
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _location(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
            height: 1500.0,
            width: 3000.0,
          ),
          FutureBuilder<dynamic>(
            future: network.getdetils(widget.id),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!isEntered && snapshot.data != null) {
                for (int i = 0; i < snapshot.data.length; i++) {
                  fav.add(false);
                }
                isEntered = true;
              }
              if (snapshot.hasData) {
                return ListView.builder(

                    // padding: EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var image = snapshot.data[index]['clinic_image'];
                      bool isFav = fav[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                              child: Center(
                                  child: Text(
                                snapshot.data[index]['clinic_name'],
                                style: KTitel1TextStyle,
                              )),
                              height: 60.0,
                              margin: EdgeInsets.only(bottom: 10.0),
                              decoration: KBoxDecoration),
                          Container(
                              margin: EdgeInsets.all(4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  '$web/$image',
                                  height: 250,
                                  width: 300,
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.all(4),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  child: Iconcontent1(
                                      icon: Icons.call, lable: 'إتصال'),
                                  onTap: () {
                                    String _phone =
                                        snapshot.data[index]['number'];
                                    _makePhoneCall('tel:$_phone');
                                  },
                                ),
                                GestureDetector(
                                  child: Iconcontent1(
                                    icon: isFav
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                   // color: Colors.teal,
                                    lable: 'المفضلة',
                                  ),
                                  onTap: () {
                                    setState(() {
                                      fav[index] = !fav[index];
                                    });
                                      network.sendfavoritData(
                                          snapshot.data[index]['clinic_name'],
                                          snapshot.data[index]['clinic_image'],
                                          int.parse(snapshot.data[index]['id']),
                                          int.parse(userId));

                                  },
                                ),
                                GestureDetector(
                                  child: Iconcontent1(
                                    icon: Icons.directions,
                                    lable: 'المسافة',
                                  ),
                                  onTap: () {
                                    var lang = double.parse(
                                        snapshot.data[index]['longitude']);
                                    var lat = double.parse(
                                        snapshot.data[index]['latitude']);
                                    _location(
                                        'https://www.google.com/maps/search/?api=1&query=$lat,$lang');
//                                    _location(
//                                        'https://www.google.com/maps/search/?api=1&query=15.369383,44.189486');
                                  },
                                ),
                                GestureDetector(
                                    child: Iconcontent1(
                                      icon: Icons.book,
                                      lable: 'الحجز',
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => BookingInfo(
                                                  id: int.parse(snapshot
                                                      .data[index]['id']))));
                                    }),
                                GestureDetector(
                                    child: Iconcontent1(
                                      icon: Icons.comment,
                                      lable: 'التعليقات',
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Comments(
                                                  id: int.parse(snapshot
                                                      .data[index]['id']))));
                                    })
                              ],
                            ),
                          ),
                          Cardinfo(
                              icon: Icons.location_city,
                              title: snapshot.data[index]['address']),
                          Cardinfo(
                            icon: Icons.person,
                            title: snapshot.data[index]['doctor_name'],
                          ),
                          Cardinfo(
                              icon: Icons.call,
                              title: snapshot.data[index]['number']),
                          Cardinfo(
                              icon: Icons.language,
                              title: snapshot.data[index]['social_media']),
                          Cardinfo(
                              icon: Icons.book,
                              title: snapshot.data[index]['booking_re']),
                        ],
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ])));
  }
}
