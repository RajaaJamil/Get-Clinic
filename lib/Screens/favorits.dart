import 'package:flutter/material.dart';
import 'package:clinic_app/Screens/clinicinfo.dart';
import 'package:clinic_app/Screens/drawer.dart';
import 'package:clinic_app/utilities/constant.dart';
import 'package:clinic_app/services/Network.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clinic_app/services/local_data.dart';

class Favorits extends StatefulWidget {
  @override
  _FavoritsState createState() => _FavoritsState();
}

class _FavoritsState extends State<Favorits> {
  Network network = Network();
  Color aa = Colors.black;
  String userId;
  void initState() {
    getUser().then((value) {
     // print("User is $value");
      setState(() {
        userId = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // key: _drawerkey,
      backgroundColor: Color(0xFF0F7375),

      drawer: Drawerofitem(),
//
      body:userId==null? Center(child: CircularProgressIndicator()): SafeArea(
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
                child: Text('المفضلة', style: KTitel1TextStyle),
              ),
              height: 60.0,
              margin: EdgeInsets.only(bottom: 15.0),
              decoration: KBoxDecoration),

          FutureBuilder<dynamic>(
              future: network.getfavorit(int.parse(userId)),
              initialData: [],
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: EdgeInsets.only(top: 70),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var image = snapshot.data[index]['image'];
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
                                              builder: (context) => Clinic_Info(
                                                    id: int.parse(
                                                        snapshot.data[index]
                                                            ['clinic_id']),
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
                                            width: 90,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                snapshot.data[index]['name'],
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
