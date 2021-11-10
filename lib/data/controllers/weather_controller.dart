import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_app/data/controllers/liked_cities_controller.dart';
import 'package:weather_app/data/model/weather_info.dart';
import 'package:weather_app/useCases/weather_reports.dart';

class WeatherInfoController extends GetxController {
  //Variables observables

  var _loading = true.obs;
  var _reports = <WeatherInfo>[].obs;
  LikedCitiesController controller = Get.put(LikedCitiesController());
  var _initialCities = <String>[].obs;

  //Iniciliza WeatherReports
  WeatherReports weatherReports = WeatherReports();

  //Getters
  bool get loading => _loading.value;
  List<WeatherInfo> get reports => _reports;
  List<String> get initialCities => _initialCities;

  WeatherInfoController() {
    log("Cargando ciudades con like previo ...");
    onInit();
  }

  Future<void> onInit() async {
    getCityWeather('bogota');
    print(_reports.length);
    //====================================
    //ESTO ESTA FALLANDO PLS NO CORRER :(
    //====================================

    initialCities = controller.loadLiked();
    log("Ciudades con like previo: " + initialCities.toString());

    for (String city in initialCities) {
      getCityWeather(city);
    }
  }

  Future<bool> getCityWeather(String city) async {
    // Uniformizar city
    city = city.toLowerCase().trim();

    // Se busca en la lista
    int idx = _reports.indexWhere((element) => element.name == city);
    print("este es el index" + idx.toString());

    // Si se encuentra la ciudad
    if (idx != -1) {
      updateCityWeather(city);

      // Si no se encuentra la ciudad
    } else {
      print("entre en el else");

      _loading.value = true;
      WeatherInfo local = await weatherReports.getCityInfo(city);
      _reports.add(local);
    }

    _loading.value = false;
    // _reports.refresh();

    print("Estos son los reports" + _reports.length.toString());
    return true;
  }

  void deleteCityWeather(String city) {
    city = city.toLowerCase().trim();

    for (int i = 0; i < _reports.length; i++) {
      if (_reports[i].name!.toLowerCase().trim() == city) {
        _reports.removeAt(i);
        break;
      }
    }

    _reports.refresh();
  }

  void updateCityWeather(String city) async {
    for (int i = 0; i < _reports.length; i++) {
      if (_reports[i].name!.toLowerCase().trim() == city) {
        _reports.removeAt(i);
        _loading.value = true;
        var local = await weatherReports.getCityInfo(city);
        _reports.insert(i, local);
      }
    }

    _loading.value = false;
    _reports.refresh();
  }
}
