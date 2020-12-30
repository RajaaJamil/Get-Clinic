import 'package:flutter/material.dart';
import 'package:clinic_app/utilities/constant.dart';
import 'package:clinic_app/services/Network.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clinic_app/services/local_data.dart';

class Comments extends StatefulWidget {
  Comments({this.id});
  final id;
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  // GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  Network network = Network();
  String userId;
  String comment;
  TextEditingController mycontroler = TextEditingController();
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
      //drawer: Drawerofitem(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SvgPicture.asset(
              'images/back.svg',
              fit: BoxFit.fill,
              height: 500.0,
              width: 5000.0,
            ),
            Container(
                child: Center(
                    child: Text(
                  'التعليقات',
                  style: KTitel1TextStyle,
                )),
                height: 60.0,
                margin: EdgeInsets.only(bottom: 15.0),
                decoration: KBoxDecoration),
            Column(
              children: <Widget>[
                FutureBuilder<dynamic>(
                    future: network.getcomments(widget.id),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data == null
                            ? Center(child: CircularProgressIndicator())
                            : Flexible(
                                flex: 3,
                                child: ListView.builder(
                                    padding: EdgeInsets.only(top: 70),
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: ListTile(
                                          title: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot.data[index]['name'],
                                              style: TextStyle(
                                                  fontSize: 19.0,
                                                  color: Color(0xFF2A3D42),
                                                  fontFamily: 'Tajawal'),
                                            ),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15, bottom: 10),
                                            child: Text(
                                              snapshot.data[index]['comment'],
                                              style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  color: Color(0xFF2A3D42)),
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      );
                                    }),
                              );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
                Flexible(
                  flex: 0,
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: TextFormField(
                            controller: mycontroler,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'الرجاء تعبئة الحقل';
                              }

                              return null;
                            },
                            onChanged: (value) {
                              comment = value;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'إضافة تعليق',
                              hintStyle: TextStyle(fontFamily: 'Tajawal'),
                              hoverColor: Color(0xFF0F7275),
                              alignLabelWithHint: true,
//                              focusedBorder: OutlineInputBorder(
//                                  gapPadding: 15,
//                                  borderRadius: BorderRadius.circular(5.0),
//                                  borderSide: BorderSide(
//                                      color: Color(0xFF0F7275), width: 2.0)),
//                              focusColor: Color(0xFF0F7275),
                            ),
                          )),
                          FlatButton(
                            onPressed: () {
                              network.sendcomment(
                                  comment, int.parse(userId), widget.id);
                              mycontroler.text = '';
                              setState(() {
                                network.getcomments(widget.id);
                              });
                            },
                            child: new Icon(
                              Icons.send,
                              color: Color(0xFF0F7275),
                              size: 40,
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Color(0xFF0F7275), width: 2.0))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
