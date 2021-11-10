// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/controllers/weather_controller.dart';
import 'package:weather_app/data/model/weather_info.dart';
import 'package:weather_app/widgets/searchbar.dart';
import 'package:weather_app/widgets/weather_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherInfoController controller = Get.find();

  // List<WeatherCard> items = [];

  // @override
  // Future<bool> onInit() async {
  //   items = await getCards();
  //   log("numero de items en carrusel: " + items.length.toString());
  //   return true;
  // }

  // List<WeatherCard> getCards() {
  //   List<WeatherInfo> data = controller.reports;
  //   log("controller reports: " + controller.reports.toString());
  //   List<WeatherCard> list = [];

  //   for (int i = 0; i < data.length; i++) {
  //     var card = WeatherCard(data[i], data[i].name!);
  //     list.add(card);
  //   }

  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    List<WeatherCard> list = [];

    for (var weather in controller.reports) {
      list.add(WeatherCard(weather, weather.name.toString(), false));
    }
    for (var likedCity in controller.initialCities) {
      list.add(WeatherCard(likedCity, likedCity.name.toString(), true));
    }

    return MaterialApp(
        title: 'Weather App',
        home: Scaffold(
          appBar: AppBar(title: SearchBar(), actions: <Widget>[
            // IconButton(onPressed: (){setState(() {
            //   // isSeaching = !isSeaching;
            // });}, icon: Icon(Icons.search)),
          ]),
          backgroundColor: Colors.grey[200],
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              // Container(
              //   height: 40,
              //   color: Colors.blue,
              // ),
              // Container(
              //   padding: EdgeInsets.all(5),
              //   child: SearchBar(),
              //   height: 40,
              // ),
              // Container(height: 30, color: Colors.blue),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: list,
                  ),
                ),
              ),
            ],
          ),
        )

        // home: SingleChildScrollView(
        //   child: Center(
        //     child: Column(
        //       children: list,
        //     ),
        //   ),
        // ),

        // home: Scaffold(
        //   resizeToAvoidBottomInset: false,
        //   body: Center(
        //     child: Column(children: [
        //       Container(
        //         height: 40,
        //       ),
        //       Container(
        //         padding: EdgeInsets.all(5),
        //         height: 40,
        //         child: SearchBar(),
        //       ),
        //       Container(
        //         height: 40,
        //       ),
        //       SingleChildScrollView(
        //         child: Stack(
        //           children: list,
        //         ),
        //       )
        //     ]

        //         /*
        //       children:  <Widget>[

        //         Container(child: SearchBar(),width: 400,),
        //         CarouselSlider.builder(
        //                 options: CarouselOptions(
        //                   height: 600.0,
        //                   autoPlay: true,
        //                 ),
        //                 itemCount: items.length,
        //                 itemBuilder: (context, itemIndex, realIndex) {
        //                   return Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: items[itemIndex],
        //                   );
        //                 },
        //               ),
        //       ]*/
        //         ),
        //   ),
        // ),
        );
  }
}
