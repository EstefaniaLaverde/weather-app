import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import '../model/weather_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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




class WeatherClient {
  static const baseUrl = "https://api.openweathermap.org";
  static const apiKeyParam = ""; //Aqui va la llave?
  static const queryParam = 'q';
  final String apiKey;

  WeatherClient(this.apiKey);

  Future<List<WeatherInfo>> getItems(String city) async {

    String url = baseUrl + '/data/2.5/weather?q=' + city + '&appid=' + apiKey;
    log('Consulta a: ' + url);

    try {

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        log("Got code 200");

        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        log('Response is: ' + jsonResponse.toString());

        List<WeatherInfo> output = [];

        output.add(WeatherInfo.fromJson(jsonResponse));
        return Future.value(output);

      } else {

        logError('Client error ${response.statusCode}');
        return Future.error([]);

      }

    } catch (e) {
      log(e.toString());
      logError('Client error Timeout');
      return Future.error('Client error Timeout');
    }
  }

}
