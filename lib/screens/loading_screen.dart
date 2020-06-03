import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'e1eb700b91248074fa08c909b67e3ac5';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  void getLocationData() async{
    Location locationProvider = Location();

    await locationProvider.getCurrentLocation();

    latitude = locationProvider.latitude;
    longitude = locationProvider.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context){
          return LocationScreen();
        }
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
