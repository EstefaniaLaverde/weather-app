import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/controllers/weather_controller.dart';


void main() => runApp(
    TestDataRepo()
);

class TestDataRepo extends StatefulWidget {


  @override
  _TestDataRepoState createState() => _TestDataRepoState();
}

class _TestDataRepoState extends State<TestDataRepo> {



  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  String visualizationText = '';

  @override
  Widget build(BuildContext context) {

    WeatherInfoController controller = Get.put(WeatherInfoController());

    return GetMaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Obx(() => Text(controller.citiesNames.toString())),

            TextField(controller: textController1,),
            TextButton(onPressed: ()async{
              controller.getCityWeather(textController1.text);
              controller.update();
            }
                , child: Text('search and add!')),

            TextField(controller: textController2,),
            TextButton(onPressed: (){
              controller.deleteCityWeather(textController2.text);
              controller.update();
            }
                , child: Text('delete and unqueue!')),

            TextField(controller: textController3,),
            TextButton(onPressed: (){
              controller.updateCityWeather(textController3.text);
              controller.update();
            }
                , child: Text('update controller!')),

          ],
        ),
      ),
    );
  }
}
