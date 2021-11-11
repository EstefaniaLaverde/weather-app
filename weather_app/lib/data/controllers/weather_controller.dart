import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_app/data/controllers/liked_cities_controller.dart';
import 'package:weather_app/data/model/weather_info.dart';
import 'package:weather_app/useCases/weather_reports.dart';

class WeatherInfoController extends GetxController {
  //Variables observables
  var _loading = true.obs;
  var _reports = <WeatherInfo>[].obs;
  var _likedCities = <WeatherInfo>[].obs;

  //Iniciliza WeatherReports
  WeatherReports weatherReports = WeatherReports();

  //Llama a likedCitiescontroller
  LikedCitiesController likedController = Get.find();

  //Getters
  bool get loading => _loading.value;
  List<WeatherInfo> get reports => _reports;
  List<WeatherInfo> get likedCities => _likedCities;

  //Constructor
  WeatherInfoController() {
    _onInit();
  }

  //init
  @override
  Future<void> _onInit() async {
    getCityWeather('bogota');
    print(_reports.length);

    getCityWeatherLiked(likedController.loadLiked);
  }

  //===========================functions============================
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
      _loading.value = true;
      WeatherInfo local = await weatherReports.getCityInfo(city);
      _reports.insert(0, local);
    }

    _loading.value = false;
    // _reports.refresh();

    print("Estos son los reports" + _reports.length.toString());
    return true;
  }

  //Save city as weatherInfo for liked city name
  Future<void> getCityWeatherLiked(List<String> likedList) async {
    for (var city in likedList) {
      WeatherInfo local = await weatherReports.getCityInfo(city);
      _likedCities.add(local);
    }
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

  //onLikedCity
  Future<void> updateFavCityList(String city) async {
    //Se guarda en la base de datos
    likedController.onLiked(city);
    //Se borra de reports
    deleteCityWeather(city);
    //Se guarda en likedCities
    getCityWeatherLiked([city]);
  }

  //onUnliked
  Future<void> updateFavCityListUnlike(String city) async {
    //Se borra de la base de datos
    likedController.onUnLiked(city);

    //Borrarlo de la lista
    city = city.toLowerCase().trim();

    for (int i = 0; i < _likedCities.length; i++) {
      if (_likedCities[i].name!.toLowerCase().trim() == city) {
        _likedCities.removeAt(i);
        break;
      }
    }
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
