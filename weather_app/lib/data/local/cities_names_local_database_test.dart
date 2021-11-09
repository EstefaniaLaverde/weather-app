import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:weather_app/data/model/city_info.dart';
import 'package:weather_app/data/local/cities_names_local_database.dart';

void main() async{
  await Hive.initFlutter();

  Hive.registerAdapter(CityAdapter());
  await Hive.openBox<City>('citiesList');

  runApp(TestHive());
}


class TestHive extends StatefulWidget {
  TestHive({Key? key}) : super(key: key);

  @override
  _TestHiveState createState() => _TestHiveState();
}


class _TestHiveState extends State<TestHive> {

  CityNamesDatabaseConnection data = CityNamesDatabaseConnection();
  String text = "";

  void onPush(){
    List<String> results = data.searchCities("Ba");

    setState(() {
      text = results.toString();

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Column(
              children: <Widget>[

                data.isNotEmpty()?
                Container(
                  child: Text("{$text}"),
                ) : Container(child: Text("no hay"),),

                TextButton(onPressed: onPush, child: Text('Loadme :D')),
              ]
          ),
        )
    );
  }
}
