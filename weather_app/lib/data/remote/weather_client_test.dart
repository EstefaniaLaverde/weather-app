import 'package:flutter/material.dart';
import 'package:weather_app/data/remote/weather_client.dart';

import '../model/weather_info.dart';

void main() => runApp(TestWeatherClient());

class TestWeatherClient extends StatefulWidget {

  @override
  _TestWeatherClientState createState() => _TestWeatherClientState();
}

class _TestWeatherClientState extends State<TestWeatherClient> {
  WeatherClient client = WeatherClient('4fd881dad6fd9eb5278d268a9d73df6f');

  String msg = 'intentoooo';

  getText() async{
    List<WeatherInfo> list = await client.getItems('bogota');

    setState(() {
      msg = list[0].temperature;
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              child:  Text(msg),
            ),
            TextButton(onPressed: getText, child: Text('push me')),
          ],
        ),
      ),
    );
  }
}




