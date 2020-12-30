import 'package:flutter/material.dart';
import 'package:clinic_app/Screens/clinicinfo.dart';
import 'package:clinic_app/Screens/drawer.dart';
import 'package:clinic_app/utilities/constant.dart';
import 'package:clinic_app/services/Network.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clinic_app/services/local_data.dart';

class ListOFclinics extends StatefulWidget {
  ListOFclinics({this.special, this.icons});
  final special;
  final icons;

  @override
  _ListOFclinicsState createState() => _ListOFclinicsState();
}

class _ListOFclinicsState extends State<ListOFclinics> {
  // GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  Network network = Network();
  bool isEntered = false;
  List<bool> fav = [];
  String userId;
  @override
  void initState() {
    getUser().then((value) {
      print("User is $value");
      userId = value;
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // key: _drawerkey,
      backgroundColor: Color(0xFF0F7375),

      drawer: Drawerofitem(),

      body: SafeArea(
          child: Stack(
        children: <Widget>[
          SvgPicture.asset(
            'images/back.svg',
            fit: BoxFit.fill,
            height: 1500.0,
            width: 5000.0,
          ),
          Container(
              child: Center(
                child: Image.asset(
                  widget.icons,
                  height: 50,
                  width: 50,
                ),
              ),
              height: 60.0,
              margin: EdgeInsets.only(bottom: 15.0),
              decoration: KBoxDecoration),
          FutureBuilder<dynamic>(
              future: network.getclinics(widget.special),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!isEntered && snapshot.data != null) {
                  for (int i = 0; i < snapshot.data.length; i++) {
                    fav.add(false);
                  }
                  isEntered = true;
                }

                if (snapshot.hasData) {
                  return snapshot.data == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          padding: EdgeInsets.only(top: 70),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var image = snapshot.data[index]['clinic_image'];
                            bool isFav = fav[index];
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Clinic_Info(
                                                        id: int.parse(snapshot
                                                            .data[index]['id']),
                                                      )));
                                        },
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          margin: EdgeInsets.all(7),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Image.network(
                                                '$web/$image',
                                                height: 100,
                                                width: 80,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    snapshot.data[index]
                                                        ['clinic_name'],
                                                    style: KLabelTextStyle,
                                                  ),
//                      Padding(padding: EdgeInsetsDirectional.only(bottom: 10)),
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(Icons.star),
                                                      Icon(Icons.star),
                                                      Icon(Icons.star),
                                                      Icon(Icons.star),
                                                      Icon(Icons.star)
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      fav[index] = !fav[index];
                                                    });
                                                    network.sendfavoritData(
                                                        snapshot.data[index]
                                                            ['clinic_name'],
                                                        snapshot.data[index]
                                                            ['clinic_image'],
                                                        int.parse(snapshot
                                                            .data[index]['id']),
                                                        int.parse(userId));
                                                  },
                                                  icon: Icon(
                                                    isFav
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    color: Colors.teal,
                                                  ))
//
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ],
      )),
    );
  }
}
