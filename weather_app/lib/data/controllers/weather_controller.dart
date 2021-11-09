import 'dart:developer';
import 'dart:html';

import 'package:get/get.dart';
import 'package:weather_app/data/data_repository.dart';
import 'package:weather_app/data/model/weather_info.dart';
import 'package:weather_app/useCases/weatherReports.dart';


class WeatherInfoController extends GetxController{

  WeatherReports weatherReports = WeatherReports();
  var _loading = true.obs;
  var reports = <WeatherInfo>[].obs;

  bool get loading => _loading.value;


  WeatherInfoController(){
    log("reports: " + reports.toString());
    onInit();
    log("reports: " + reports.toString());
    _loading.value = false;
    reports.refresh();
  }

  @override
  Future<void> onInit() async{
    getCityWeather('bogota');
  }

   Future<WeatherInfo> getCityWeather(String city) async{

     city = city.toLowerCase().trim();
     int idx = reports.indexWhere((element) => element.name == city);

     if (idx != -1){
       updateCityWeather(city);
     }else{
       _loading.value = true;
       WeatherInfo local =  await weatherReports.getCityInfo(city);
       reports.add(local);
     }

     _loading.value = false;
     reports.refresh();
     return reports.last;
  }

  void deleteCityWeather(String city){

    city = city.toLowerCase().trim();

    for (int i = 0; i< reports.length; i++){
        if (reports[i].name!.toLowerCase().trim() == city){
          reports.removeAt(i);
          break;
        }
    }

    reports.refresh();
  }

  void updateCityWeather(String city) async {

    for (int i = 0; i< reports.length; i++){
      if (reports[i].name!.toLowerCase().trim() == city){

        reports.removeAt(i);
        _loading.value = true;
        var local = await weatherReports.getCityInfo(city);
        reports.insert(i, local);
      }
    }

    _loading.value = false;
    reports.refresh();
  }

}


