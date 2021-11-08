import 'package:get/get.dart';
import 'package:weather_app/data/data_repository.dart';
import 'package:weather_app/data/model/weather_info.dart';


class WeatherInfoController extends GetxController{

  late DataRepo dataBase = DataRepo();

  WeatherInfo getWeatherInfoFor(String city){
    return dataBase.getCityWeather(city);
  }

  void deleteCityWeather(String city){
    dataBase.removeCityWeather(city);
  }


}


