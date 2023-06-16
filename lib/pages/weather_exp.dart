import 'package:Assisgnment/pages/api_service.dart';
import 'package:Assisgnment/styles/text_styles.dart';
import 'package:Assisgnment/utils/weather_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherExp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ApiService().getPosts(),
          builder: (context, snapshot) {

            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            final posts = snapshot.data;
            return Center(
              child: Column(children: <Widget>[
                Text(posts['name'] + " , " + posts['sys']['country'],
                    style: labelText),
                Text(
                  posts['main']['temp'].toStringAsFixed(2) + '\u00B0C',
                  style: bigText,
                ),
                Text(
                  "Humidity: " + posts['main']['humidity'].toStringAsFixed(2),
                  style: subText,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    getFormattedDate(posts['dt'], 'hh:mm a, EEEE, MMMM dd, yyyy'),
                  ),
                ),
              ]),
            );
          }),
    );
  }
}
