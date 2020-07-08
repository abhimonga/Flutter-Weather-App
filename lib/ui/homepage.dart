import 'package:flutter/material.dart';
import 'package:weatherapp/ui/weather.dart';
import 'package:weatherapp/model/weather_data.dart';
import 'package:weatherapp/api/MapApi.dart';
import 'package:location/location.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    WeatherData _weatherData;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: _weatherData != null ? Weather(weatherData: _weatherData,):
      Center(
        child:CircularProgressIndicator(
          strokeWidth: 4.0,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
    )
    );
  }
  getCurrentLocation() async{
     Location location = new Location();

bool _serviceEnabled;
PermissionStatus _permissionGranted;
LocationData _locationData;

_serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    return;
  }
}

_permissionGranted = await location.hasPermission();
if (_permissionGranted == PermissionStatus.denied) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
    return;
  }
}

_locationData = await location.getLocation();
    loadWeather(lat: _locationData.latitude,long: _locationData.longitude);
  }
  loadWeather({double lat,double long}) async{
    Mapapi mapapi=Mapapi.getInstance();
    final data=await mapapi.getWeather(lat: lat,long: long);
    setState(() {
        this._weatherData=data;
    });
  }
}