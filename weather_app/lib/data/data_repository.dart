import 'remote/weather_client.dart';
import 'model/weather_info.dart';

class DataRepo {
  late WeatherClient client;
  static const apiKey = 'a07bad622dc03a5e3d32c83776e6ec83';

  DataRepo() {
    client = WeatherClient(apiKey);
  }

  Future<List<WeatherInfo>> getItems(String topic) async {
    return await client.getItems(topic);
  }
}
