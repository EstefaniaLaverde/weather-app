import 'dart:developer';
import 'package:loggy/loggy.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/weather_info.dart';

class WeatherClient {
  static const baseUrl = "https://api.openweathermap.org";
  static const apiKeyParam = ""; //Aqui va la llave?
  static const queryParam = 'q';
  final String apiKey;

  WeatherClient(this.apiKey);

  Future<List<WeatherInfo>> getItems(String city) async {
    String url = baseUrl +
        '/data/2.5/weather?q=' +
        city +
        '&units=metric&appid=' +
        apiKey +
        "&lang=es";
    log('Consulta a: ' + url);

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        log("Got code 200");

        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
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
