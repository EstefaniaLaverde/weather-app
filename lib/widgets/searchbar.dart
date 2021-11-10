import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/controllers/weather_controller.dart';

import 'package:weather_app/data/model/city_info.dart';
import 'package:weather_app/data/local/cities_names_local_database.dart';

// Future<void> main() async{

//   await Hive.initFlutter();
//   Hive.registerAdapter(CityAdapter());
//   await Hive.openBox<City>('citiesList');

//   runApp(AutocompleteExampleApp());
// }

// class AutocompleteExampleApp extends StatelessWidget {
//   AutocompleteExampleApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Autocomplete Basic'),
//         ),
//         body:  Center(
//           //child: SearchBar(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[

//                 SizedBox(height: 30,),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                     Icon(Icons.search, size: 40,),
//                     SizedBox(width: 10,),
//                     Container(child: SearchBar(),width: 400,),
//                   ],
//                 ),

//             ],
//           )
//         ),
//       )
//     );
//   }
// }

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  //crea una instancia de la base de datos de nombres de ciudades
  CityNamesDatabaseConnection cityNames = CityNamesDatabaseConnection();
  WeatherInfoController controller = Get.find();
  bool initialized = false;
  String _searchText = "";
  List<String> _options = [''];

  @override
  Widget build(BuildContext context) {
    return Autocomplete(
      initialValue: const TextEditingValue(text: "Search"),
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (!initialized) {
          cityNames.onInit();
          initialized = true;
        }

        //Si no han metido texto
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }

        //Hace la query de nombres de ciudad
        if (textEditingValue.text.length >= 3) {
          _options = cityNames.searchCities(textEditingValue.text);
        }

        return _options;
      },
      onSelected: (String selection) {
        String query = selection.split(",")[0].toLowerCase().trim();
        controller.getCityWeather(query);
        print("La seleccion: " + selection);
        print('Seleccionaste: $_options');
      },
    );
  }
}
