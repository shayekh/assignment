import 'package:Assisgnment/pages/current_weather_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: CurrentWeatherPage(),
    );
  }
}
