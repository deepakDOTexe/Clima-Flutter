import 'package:flutter/material.dart';

import '../services/location.dart';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async{
    Location locationProvider = Location();
    await locationProvider.getCurrentLocation();
    print(locationProvider.latitude);
    print(locationProvider.longitude);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
//            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
