import 'package:get/get.dart';
import 'package:weather_app/data/data_repository.dart';


class WeatherInfoController extends GetxController{

  var dataBase = [DataRepo()].obs;

  get citiesNames => dataBase.isNotEmpty? dataBase[0].citiesNames : [];
  get citiesInfo => dataBase.isNotEmpty? dataBase[0].citiesInfo : [];

  @override
  Future<void> onInit() async{
  }

  void getCityWeather(String city) async{

     await dataBase[0].getCityWeather(city);
     dataBase.refresh();
  }

  void deleteCityWeather(String city){
    dataBase[0].removeCityWeather(city);
    dataBase.refresh();
  }

  void updateCityWeather(String city) async {
    await dataBase[0].updateCityWeather(city);
    dataBase.refresh();
  }

}


