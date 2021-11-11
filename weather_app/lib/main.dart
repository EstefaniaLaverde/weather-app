import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/controllers/liked_cities_controller.dart';

import 'package:weather_app/home_page.dart';
import 'data/controllers/weather_controller.dart';
import 'data/model/city_info.dart';
import 'package:weather_app/data/model/city_info.dart';
import 'package:weather_app/ui/loading_view.dart';

void main() async {
  //Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(CityAdapter());

  await Hive.openBox<City>('citiesList');
  await Hive.openBox<City>('favCities');

  //Initialize controllers
  Get.put(LikedCitiesController());
  WeatherInfoController controller = Get.put(WeatherInfoController());

  runApp(GetMaterialApp(
    home: Obx(() {
      log("Numero de liked al iniciar: " +
          controller.likedCities.length.toString());
      log("Numero de reports al iniciar: " +
          controller.reports.length.toString());

      if (controller.loading) {
        return const LoadingView();
      } else {
        if (controller.reports.isEmpty && controller.likedCities.isEmpty) {
          controller.getCityWeather("bogota");
        }
        return MyHomePage();
      }
    }),
  ));
}
