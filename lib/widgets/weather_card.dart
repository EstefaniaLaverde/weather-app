//List item
// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:weather_app/data/controllers/liked_cities_controller.dart';
import 'package:weather_app/data/model/weather_info.dart';
import 'package:weather_app/widgets/info_mini_card.dart';

class WeatherCard extends StatelessWidget {
  //const WeatherCard({Key? key}) : super(key: key);

  String cityname;
  late WeatherInfo info;
  LikedCitiesController controller = Get.find();
  bool liked;

  WeatherCard(this.info, this.cityname, this.liked);

  Future<bool> onLikedButtonTapped(bool input) async {
    if (liked) {
      liked = false;
      controller.onUnLiked(cityname);
    } else {
      liked = true;
      controller.onLiked(cityname);
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            color: Colors.grey[100],
            // elevation: 20,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(15.0),
            // ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //quitar const despues
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
                        'Humedad', info.humidity + ' %', Icon(Icons.opacity)),
                    InfoMiniCard('Viento', ' km/h', Icon(Icons.verified)),
                    InfoMiniCard(
                        'Sensacion', info.sensation + ' °C', Icon(Icons.home)),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: LikeButton(
                        onTap: onLikedButtonTapped,
                        isLiked: liked,
                      ),
                    )
                  ],
                )
              ],
            )));

    // return Center(
    //   child: Card(
    //       elevation: 10,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(15.0),
    //       ),
    //       child: Flex(
    //         direction: Axis.horizontal,
    //         children: [
    //           Flexible(
    //               flex: 1,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 // ignore: prefer_const_literals_to_create_immutables
    //                 children: [
    //                   // Text(info.name.toString()),
    //                   const Text('Ciudad'),
    //                   Column(),
    //                   LikeButton(
    //                     onTap: onLikedButtonTapped(),
    //                   )
    //                 ],
    //               )),
    //           Flexible(
    //             flex: 4,
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Row(
    //                   // mainAxisAlignment: MainAxisAlignment.center,
    //                   // crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     InfoMiniCardTemp('23 °C'),
    //                     InfoMiniCardSens('Nublado')
    //                   ],
    //                 ),
    //                 Row(
    //                   // mainAxisAlignment: MainAxisAlignment.center,
    //                   // crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     InfoMiniCardHumidity('54%'),
    //                     InfoMiniCardWind('20km/h')
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           )
    //         ],
    //       )),
    // );
  }
}
