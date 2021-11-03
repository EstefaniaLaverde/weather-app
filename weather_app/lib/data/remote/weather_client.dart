import 'package:loggy/loggy.dart';
import '../model/weather_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherClient {
  static const baseUrl = "https://api.openweathermap.org";
  static const apiKeyParam = ""; //Aqui va la llave?
  static const queryParam = 'q';
  final String apiKey;

  WeatherClient(this.apiKey);

  Future<List<WeatherInfo>> getItems(String city) async {
    var uri = Uri.parse('https://api.openweather.org/data/2.5/weather')
        .resolveUri(Uri(queryParameters: {
      "q": "city",
      "appid": apiKey,
    }));

    logInfo('Client getItems URI ${uri.toString()}');

    try {
      final response = await http.get(uri).timeout(Duration(seconds: 1));

      if (response.statusCode == 200) {
        logInfo("Got code 200");
        var jsonResponse = convert.jsonDecode(response.body);

        int itemCount = jsonResponse['response']['total'];
        logInfo("We got $itemCount items");

        if (itemCount == 0) {
          logError('No info came from the api :(');
        }

        List<WeatherInfo> output = [];

        for (var item in jsonResponse['response']['results']) {
          output.add(WeatherInfo.fromJson(item));
        }
        logInfo("Client return ok");
        return Future.value(output);
      } else {
        logError('Client error ${response.statusCode}');
        return Future.error([]);
      }
    } catch (e) {
      logError('Client error Timeout');
      return Future.error('Client error Timeout');
    }
  }
}
