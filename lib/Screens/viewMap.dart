import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:clinic_app/services/Network.dart';

class ViewMap extends StatefulWidget {
  @override
  _ViewMapState createState() => _ViewMapState();
}

class _ViewMapState extends State<ViewMap> {
  bool isNormal = true;
  Completer<GoogleMapController> _controller = Completer();
  LocationData currentLocation;
  LatLng marker;
  Network network = Network();
  void _getUserLocation() async {
    Location location = new Location();

    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    location.getLocation().then((value) {
      setState(() {
        currentLocation = value;

        print( currentLocation.runtimeType);
        print(currentLocation.latitude.runtimeType);
        LatLng temp = LatLng(
          currentLocation.latitude,
          currentLocation.longitude,
        );
        marker = temp;

        animateTo(currentLocation.latitude, currentLocation.longitude);
      });
    });
  }

  Future<void> animateTo(double lat, double lng) async {
    final c = await _controller.future;
    final p = CameraPosition(target: LatLng(lat, lng), zoom: 14.4746);
    c.animateCamera(CameraUpdate.newCameraPosition(p));
  }

  @override
  void initState() {
    _getUserLocation();
    getdata();
  }

  var data;
  Future<dynamic> getdata() async {
    data = await network.getlatlang();
  }

  Widget build(BuildContext context) {
    List<Marker> markers = <Marker>[];
    if (data != null) {
      for (var item in data) {
        markers.add(Marker(
            position: LatLng(double.parse(item["latitude"]),double.parse(item["longitude"])),
            draggable: false,
            infoWindow: InfoWindow(title: item["clinic_name"]),
            markerId: MarkerId("myMarker")));
      }
    }

    return Scaffold(
      body: currentLocation != null && data != null
          ? GoogleMap(
              mapType: isNormal ? MapType.normal : MapType.satellite,
              initialCameraPosition: CameraPosition(
                target: currentLocation != null
                    ? LatLng(
                        currentLocation.latitude, currentLocation.longitude)
                    : LatLng(15.3694, 44.1910),
                zoom: 14.4,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set<Marker>.of(markers),
            )
          : Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.cyan,
            )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            isNormal = !isNormal;
          });
        },
        label: Text(
          'تغيير نوع الخريطة',
          style: TextStyle(
              fontFamily: "Bukra", fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.map),
      ),
    );
  }
}
