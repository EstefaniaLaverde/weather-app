import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:weather_app/data/model/city_info.dart';

/*
    Conexión con la base de datos local de Hive, primero debe inicializar la base
    de datos Hive al leer los nombres de las ciudades y su país en el
    archivo 'world_cities.json', y apartir de allí es capaz de hacer queries
 */

class CityNamesDatabaseConnection{

  //busca la caja con el nombre 'citiesList'
  final box = Hive.box<City>('citiesList');

  NamesDatabaseConnection(){
    onInit();
  }

  Future<void> onInit()  async{

      print("leyendo json...");

      // toma el json y lo pasa a un string
      String rawData = await rootBundle.loadString('assets/world_cities.json');

      // decodifica el json
      List<dynamic> decodedData = await json.decode(rawData);


      // va creando nuevas ciudades conforme lee la lista de los json
      // y guarda cada ciudad en la base de datos de hive

      print("Cargando base de datos Hive");
      for(int i = 0; i < decodedData.length; i++){

          City localCity = City(decodedData[i]["name"],  decodedData[i]["country"]);
          box.put(i, localCity);
      }

      print("Datos cargados en Hive: ");

      for (int i = 0; i <3; i++){
        print(box.getAt(i));
      }
      print("...");

  }


  List<String> searchCities(String searchText){

      //pasa el texto a minusculas y le quita espacios de los lados que pueda tener
      searchText = searchText.toLowerCase();
      searchText = searchText.trim();


      //busca las ciudades cuyo nombre en minúsculas comienza con el texto de búsqueda dado
      print("Iniciando búsqueda de palabra: $searchText");
      Iterable<City> filtered = box.values.where((City) => City.name!.toLowerCase().startsWith(searchText));

      if (filtered.isNotEmpty) {
        print("Se encontraron resultados");
      }else{
        print("No hay resultados de búsqueda para: $searchText");
      }

      List<String> result = [];
      int counter = 0;

      for (City filteredCity in filtered){

          // si obtiene una ciudad que es nula (es decir que no hay más ciudades)
          // o si ya tiene 10 resultados acaba el for
          if ((filteredCity == null) ||( counter > 9)){
              break;
          }

          result.add(filteredCity.name! + ", "  + filteredCity.country! );
          counter++;
      }

      return result;
  }

  bool isEmpty (){
    return box.isEmpty;
  }

  bool isNotEmpty (){
    return box.isNotEmpty;
  }

}
