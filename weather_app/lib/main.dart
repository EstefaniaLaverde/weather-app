import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:weather_app/home_page.dart';
import 'data/controllers/weather_controller.dart';
import 'data/model/city_info.dart';
import 'package:weather_app/data/model/city_info.dart';
import 'package:weather_app/ui/loading_view.dart';

void main() async{

  await Hive.initFlutter();
  Hive.registerAdapter(CityAdapter());
  await Hive.openBox<City>('citiesList');
  WeatherInfoController controller =  Get.put(WeatherInfoController());

  runApp(
    GetMaterialApp(
     home: Obx(() => controller.loading? LoadingView() : MyHomePage()),
    )
  );
}

