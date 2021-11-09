import 'package:weather_app/data/data_repository.dart';
import 'package:weather_app/data/model/weather_info.dart';

class WeatherReports{

  final DataRepo _dataRepo = DataRepo();


  Future<WeatherInfo> getCityInfo(String city)async{

    return await _dataRepo.getCityWeather(city);
  }


}