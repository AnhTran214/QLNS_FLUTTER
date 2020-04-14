import 'dart:async';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qlns/core/navigation/navigate.dart';
import 'package:qlns/ui/constants/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 0;
const LatLng SOURCE_LOCATION = LatLng(42.747932, -71.167889);
const LatLng DEST_LOCATION = LatLng(10.802803, 106.647040);

class Timekeeping extends StatefulWidget {
  @override
  _Timekeeping createState() => _Timekeeping();
}

class _Timekeeping extends State<Timekeeping> {
  CameraController controller;
  CameraLensDirection _direction = CameraLensDirection.front;
  Completer<GoogleMapController> _controller = Completer();
  Location location;
  LocationData _locationData;

//  static final CameraPosition _kGoogle = CameraPosition(
//    target: LatLng(_locationData.latitude, _locationData.longitude),
//    zoom: 14.4746,
//  );

//  static final CameraPosition _kLake = CameraPosition(
//      bearing: 0.0,
//      target: LatLng(10.802803, 106.647040),
//      tilt: 59.440717697143555,
//      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _initializePotion();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<CameraDescription> getCamera(CameraLensDirection dir) async {
    return await availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }

  _initializeCamera() async {
    CameraDescription description = await getCamera(_direction);
    controller = CameraController(
      description,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.low
          : ResolutionPreset.medium,
    );
    await controller.initialize();
    setState(() {});
  }

  _initializePotion() async {
    location = new Location();
    location.changeSettings(
        accuracy: LocationAccuracy.HIGH, distanceFilter: 100);
    location.onLocationChanged().listen((LocationData cLoc) {
      _locationData = cLoc;
      print("Vị trí hiện tại");
      print(_locationData.latitude);
      print(_locationData.longitude);
    });
    _locationData = await location.getLocation();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Thông báo'),
            content: new Text('Bạn có chắc muốn thoát ứng dụng?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Không'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Có'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: color_header,
            highlightColor: color_header,
            accentColor: color_header),
        title: "Timekeeping",
        home: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: color_white_text1,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigation().goToHome(context);
                },
              ),
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: color_header),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Chấm công online",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color_white_text1),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: color_white_icons,
                          ),
                          onPressed: null)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.info, color: Colors.black),
                          onPressed: null),
                      Text(
                        "xxxxx - Tran Hoang Nam Anh",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ),
//              FutureBuilder(
//                future: _initializeCamera(),
//                builder: (context, snapshot) {
//                  if (snapshot.connectionState == ConnectionState.waiting) {
//                    return Container();
//                  } else
//                    return Container(
//                      height: MediaQuery.of(context).size.width,
//                      child: Padding(
//                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0 ),
//                        child: AspectRatio(
//                            aspectRatio: controller.value.aspectRatio,
//                            child: CameraPreview(controller)),
//                      )
//                    );
//                },
//              ),
                Container(
                    height: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: controller != null
                            ? AspectRatio(
                                aspectRatio: controller.value.aspectRatio,
                                child: CameraPreview(controller))
                            : Center(child: Text('Đang tải camera')))),
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          child: FlatButton(
                              color: Colors.blueGrey,
                              textColor: Colors.white,
                              disabledColor: Colors.blueGrey,
                              disabledTextColor: Colors.white,
                              splashColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.blueGrey)),
                              onPressed: () {},
                              child: Text("Báo lỗi"))),
                      Container(
                          padding: EdgeInsets.only(right: 4.0, left: 4.0),
                          child: FlatButton(
                              color: Colors.lightBlue,
                              textColor: Colors.white,
                              disabledColor: Colors.blueGrey,
                              disabledTextColor: Colors.white,
                              splashColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.lightBlue)),
                              onPressed: () {},
                              child: Text("Chấm công"))),
                      Container(
                          child: FlatButton(
                              color: Colors.blueGrey,
                              textColor: Colors.white,
                              disabledColor: Colors.blueGrey,
                              disabledTextColor: Colors.white,
                              splashColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.blueGrey)),
                              onPressed: () {},
                              child: Text("Tải lại vị trí"))),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Text(
                          "Tọa độ:" +
                              "(x,y)",
                          style: TextStyle(fontSize: 11.0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom:10.0),
                        child: Text(
                          "Khoảng cách: 100m",
                          style: TextStyle(fontSize: 11.0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Vị trí cho phép: Nhiều vị trí",
                          style: TextStyle(fontSize: 11.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 300.0,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: FutureBuilder(
                      future: _initializePotion(),
                      builder: (context, data) {
                        if (data.connectionState == null) {
                          return Center(child: Text('Đang tải map'));
                        } else
                          return GoogleMap(
                            myLocationButtonEnabled: true,
                            myLocationEnabled: true,
                            mapType: MapType.hybrid,
                            initialCameraPosition: CameraPosition(
                                zoom: 16,
                                tilt: CAMERA_TILT,
                                bearing: CAMERA_BEARING,
                                target: LatLng(_locationData.latitude,
                                    _locationData.longitude)),
                            onMapCreated: (GoogleMapController controller1) {
                              _controller.complete(controller1);
                            },
                          );
                      },
                    )),
              ],
            )),
      ),
    );
  }
//    Future<void> _goToTheLake() async {
//    final GoogleMapController controller1 = await _controller.future;
//    controller1.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//  }
}
