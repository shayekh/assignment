import 'dart:convert';

import 'package:Assisgnment/models/current_weather_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class WeatherProvider with ChangeNotifier{

  CurrentWeatherResponse _currentWeatherResponse;

  CurrentWeatherResponse get currentData => _currentWeatherResponse;

  Future<void> getCurrentData() async
  {
    try{
      final url = 'https://api.openweathermap.org/data/2.5/weather?lat=23.8280803907372&lon=90.36292385724984&units=metric&appid=2d279c313e5f34a68a30cefc9dccf139';
      final response = await get(url);
      final map= json.decode(response.body);
      _currentWeatherResponse = CurrentWeatherResponse.fromJson(map);
      notifyListeners();

    }
        catch(SocketException){
            // throw error;
          print('No Internet');
        }
    // print(response.body);
  }

}