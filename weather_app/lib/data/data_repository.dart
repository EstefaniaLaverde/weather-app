import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'remote/weather_client.dart';
import 'model/weather_info.dart';
import 'package:charset_converter/charset_converter.dart';

/*
*/


class DataRepo {

  late WeatherClient client;
  static const apiKey = '4fd881dad6fd9eb5278d268a9d73df6f';
  List<WeatherInfo> citiesInfo = [];
  List<String> citiesNames = [];

  DataRepo() {
      client = WeatherClient(apiKey);
  }

  Future<void> _loadCityWeather(String city) async {

      city = city.toLowerCase();
      city = city.trim();

      //obtiene los datos para la ciudad solicitada
      List<WeatherInfo> response = await client.getItems(city);

      //añade la información del clima a la lista

      int n = citiesInfo.length;

      if (n == 0){
          citiesInfo.add(response[0]);
          citiesNames.add(response[0].name!.toLowerCase().trim());

      }else{

          citiesInfo.insert(0, response[0]);
          citiesNames.insert(0, response[0].name!.toLowerCase().trim());

      }

      if (n < citiesInfo.length) {
        log('Data adquired for ${city}.');
      }

  }


  WeatherInfo getCityWeather(String city){

      city = city.trim();
      city = city.toLowerCase();

      int idx = citiesNames.indexWhere((element) => element == city);

      // si no encuentra la ciudad en la lista la carga
      if (idx == -1){
        _loadCityWeather(city);
        return citiesInfo[0];

      }else{
        updateCityWeather(city);
        return citiesInfo[idx];
      }

  }

  Future<void> updateCityWeather(String city)async{

    city = city.trim();
    city = city.toLowerCase();

    int idx = citiesNames.indexWhere((element) => element == city);

    if (idx != -1){

        //obtiene los datos para la ciudad solicitada
        List<WeatherInfo> response = await client.getItems(city);

        citiesNames.removeAt(idx);
        citiesNames.insert(idx, response[0].name!.trim().toLowerCase());

        citiesInfo.removeAt(idx);
        citiesInfo.insert(idx, response[0]);

        if(citiesInfo.isNotEmpty){
          log('Data updated for ${city}');
        }

    }else{
      getCityWeather(city);
    }

  }

  void removeCityWeather(String city){

      int idx = citiesNames.indexWhere((element) => element == city.toLowerCase());

      if (idx != -1){
        citiesNames.removeAt(idx);
        citiesInfo.removeAt(idx);

        log('Data about ${city} was removed.');
      }else{

        log('There was no data about ${city} to be removed.');
      }

  }




}
