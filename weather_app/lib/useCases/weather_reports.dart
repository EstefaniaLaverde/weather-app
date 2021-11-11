import 'package:weather_app/data/data_repository.dart';
import 'package:weather_app/data/model/weather_info.dart';

class WeatherReports {
  //Conexion con el repositorio
  final DataRepo _dataRepo = DataRepo();

  //Get city weather information
  Future<WeatherInfo> getCityInfo(String city) async {
    return await _dataRepo.getCityWeather(city);
  }

  // Future;

}
