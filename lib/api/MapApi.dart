import 'package:http/http.dart' show Client;
import 'package:weatherapp/model/weather_data.dart';
class Mapapi {
  static const _api_key='d3de9c566542cc933b9215952ec573ec';
  static const _endpoint='http://api.openweathermap.org/data/2.5';
  double lat,long;
  Client client=Client();
  static Mapapi _instance;
  static Mapapi getInstance()=>_instance??=Mapapi();
  String _apicall({double lat,double long}){
    return _endpoint+"/weather?lat="+lat.toString()+"&lon="+long.toString()+"&appid="+_api_key+"&units=metric";
  }
   getWeather({double lat,double long}) async{
      var response=await client.get(Uri.encodeFull(_apicall(lat: lat,long: long)),
      headers: {
        'Accept':'application/json'
      });
      return WeatherData.deserialize(response.body);
   }
}