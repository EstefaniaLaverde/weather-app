import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/model/city_info.dart';
import 'package:weather_app/widgets/searchbar.dart';


Future<void> main() async{

  await Hive.initFlutter();
  Hive.registerAdapter(CityAdapter());
  await Hive.openBox<City>('citiesList');

  runApp(AutocompleteExampleApp());
}

class AutocompleteExampleApp extends StatelessWidget {
  AutocompleteExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Autocomplete Basic'),
          ),
          body:  Center(
            //child: SearchBar(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.search, size: 40,),
                      SizedBox(width: 10,),
                      Container(child: SearchBar(),width: 400,),
                    ],
                  ),


                ],
              )
          ),
        )
    );
  }
}
