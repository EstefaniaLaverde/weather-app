import 'remote/weather_client.dart';
import 'model/weather_info.dart';

class DataRepo {
  late WeatherClient client;
  // static const apiKey = '4fd881dad6fd9eb5278d268a9d73df6f';
  static const apiKey = "a07bad622dc03a5e3d32c83776e6ec83";

  DataRepo() {
    client = WeatherClient(apiKey);
  }

  Future<WeatherInfo> getCityWeather(String city) async {
    city = city.trim();
    city = city.toLowerCase();

    List<WeatherInfo> response = await client.getItems(city);
    return response[0];
  }
}
