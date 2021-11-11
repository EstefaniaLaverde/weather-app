// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather_app/data/controllers/weather_controller.dart';
import 'package:weather_app/widgets/searchbar.dart';
import 'package:weather_app/widgets/weather_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherInfoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    List<WeatherCard> list = [];

    for (var weather in controller.reports) {
      list.add(WeatherCard(weather, weather.name.toString(), false));
    }
    for (var liked in controller.likedCities) {
      list.add(WeatherCard(liked, liked.name.toString(), true));
    }
    log("El numero de ciudades favoritas es: " +
        controller.likedCities.length.toString());
    log("El numero de ciudades en reports es: " +
        controller.reports.length.toString());

    return MaterialApp(
        title: 'Weather App',
        home: Scaffold(
          appBar:
              AppBar(title: SearchBar(), actions: <Widget>[Icon(Icons.search)]),
          backgroundColor: Colors.grey[200],
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: list,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
