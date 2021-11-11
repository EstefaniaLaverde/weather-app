//List item
// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:loggy/loggy.dart';

import 'package:weather_app/data/controllers/weather_controller.dart';
import 'package:weather_app/data/model/weather_info.dart';
import 'package:weather_app/widgets/info_mini_card.dart';

class WeatherCard extends StatelessWidget {
  //Llama al controlador
  WeatherInfoController controller = Get.find();

  //Builder y atributos
  String cityname;
  bool liked;
  late WeatherInfo info;
  WeatherCard(this.info, this.cityname, this.liked);

  Future<bool> onLikedButtonTapped(bool input) async {
    //Add to favorites or remove
    if (liked == true) {
      liked = false;
      controller.updateFavCityListUnlike(cityname);
    } else {
      liked = true;
      controller.updateFavCityList(cityname);
    }

    return !input;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            color: Colors.grey[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    cityname,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(info.weatherDescription),
                ),
                ListBody(
                  children: [
                    InfoMiniCard('Temperatura', info.temperature + ' °C',
                        Icon(Icons.thermostat_outlined)),
                    InfoMiniCard(
                        'Sensacion', info.sensation + ' °C', Icon(Icons.home)),
                    InfoMiniCard(
                        'Humedad', info.humidity + ' %', Icon(Icons.opacity)),
                    InfoMiniCard('Viento', info.windSpeed + ' km/h',
                        Icon(Icons.air_outlined)),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: LikeButton(
                        isLiked: liked,
                        onTap: onLikedButtonTapped,
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
