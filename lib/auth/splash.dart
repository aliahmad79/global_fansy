import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globalfancy/helper/images/images.dart';
import 'package:globalfancy/pages/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatelessWidget {
  late Helper helper;
  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      isInit = true;
      helper = Helper(context);
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: helper.buildBody(),
    );
  }
}

class Helper {
  BuildContext context;
//  Location location = Location();

  //Language language;
  late SharedPreferences preferences;
  int count = 1;
  bool isRemember = false, isSettingsLoaded = false, isFeaturesLoaded = false;

  Helper(this.context) {
//    checkLocationPermission();
    SharedPreferences.getInstance().then((value) {
      preferences = value;
    });
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    });
  }

//  Future<void> checkLocationPermission() async {
//    PermissionStatus permissionStatus = await location.hasPermission();
//    Utilities.latlng = LatLng(25.2048, 55.2708);
//    if (permissionStatus == PermissionStatus.granted) {
//      bool isGPSOn = await location.serviceEnabled();
//      if (isGPSOn) {
//        LocationData locationData = await location
//            .getLocation()
//            .timeout(Duration(seconds: 2))
//            .catchError((err) {
//          print(err);
//        });
//        // Utilities.latlng =
//        //     LatLng(locationData.latitude, locationData.longitude);
//        // currentLocation = LatLng(locationData.latitude, locationData.longitude);
//        // moveMapToLocation(currentLocation);
//      } else {}
//    }
//  }

  Widget buildBody() {
    CupertinoActivityIndicator();
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
              left: 80.0,
              right: 80.0,
              top: MediaQuery.of(context).padding.top + 100),
          child: Image.asset(Images.authLogo),
        ),
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom + 20,
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Theme.of(context).accentColor)),
              )),
        ),
      ],
    );
  }
}
