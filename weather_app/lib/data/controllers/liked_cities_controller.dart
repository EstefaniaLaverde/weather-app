import 'package:get/get.dart';
import 'package:weather_app/data/local/cities_names_local_database.dart';

class LikedCitiesController extends GetxController {
  CityNamesDatabaseConnection connection = CityNamesDatabaseConnection();
  late RxList<String> loadLiked = connection.loadLikedCities().obs;

  void onLiked(String city) {
    connection.onLiked(city);
  }

  void onUnLiked(String city) {
    connection.onUnLiked(city);
  }
}
