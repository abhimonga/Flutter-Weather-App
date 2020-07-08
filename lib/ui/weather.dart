import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/weather_data.dart';
class Weather extends StatelessWidget{
  final WeatherData weatherData;
 Weather({@required this.weatherData});
  @override
  Widget build(BuildContext context) {
    Widget date=Container(
      child: Text(
        DateFormat('MMMM d,H:m').format(DateTime.now()),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24.0,
        ),

      ),

    );
    Widget weather=Container(
      padding: const EdgeInsets.symmetric(
          vertical:10.0,
      ),
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text(
           weatherData.temp.toStringAsFixed(1),
           style: TextStyle(
              color: Colors.white,
             fontSize: 80.0
         )
         ),
         Expanded(

           child:Container(
             padding: EdgeInsets.only(left: 12.0),
             margin: EdgeInsets.only(left: 6.0),
             child: Text(
               '\u2103',
               style: TextStyle(fontSize: 24.0,color: Colors.white),
             ),
           ) ,
         ),
       Image.network(
         'https://openweathermap.org/img/w/${weatherData.icon}.png',
         width: 100.0,
         height: 100.0,
         fit: BoxFit.cover,
       ),

       ],
     ),
    );
    Widget description= Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            weatherData.name,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            weatherData.main,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white
            ),
          )
        ],
      ),
    );
    return Container(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           date,
          weather,
          description

        ],
      ),
    );
  }
  
}