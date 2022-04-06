import 'package:Assisgnment/providers/weather_provider.dart';
import 'package:Assisgnment/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentWeatherPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Provider.of<WeatherProvider>(context).getCurrentData();
    return  Consumer<WeatherProvider>(
      builder: (context, provider, child) =>
      provider.currentData == null ? Center(child: CircularProgressIndicator(),) :
      Center(
        child: Column(
                    children: <Widget>[
                      Text('${provider.currentData.name}, ${provider.currentData.sys.country}', style: labelText,),
                      Text('${provider.currentData.main.temp}\u00B0C', style: bigText,),
                      Text('Feels like: ${provider.currentData.main.feelsLike}\u00B0C', style: subText,)
                    ],
                  ),
      )
    );
  }
}
