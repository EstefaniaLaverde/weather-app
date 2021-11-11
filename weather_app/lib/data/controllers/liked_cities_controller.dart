import 'package:get/get.dart';
import 'package:weather_app/data/local/cities_names_local_database.dart';

class LikedCitiesController extends GetxController {
  CityNamesDatabaseConnection connection = CityNamesDatabaseConnection();
  late var _loadLiked = connection.loadLikedCities().obs;

  //Getters
  List<String> get loadLiked => _loadLiked;

  void onLiked(String city) {
    connection.onLiked(city);
    print("le diste like a " + city);
  }

  void onUnLiked(String city) {
    connection.onUnLiked(city);
    print("le diste unlike a " + city);
  }
}
