import 'package:hive/hive.dart';
part 'city_info.g.dart';


@HiveType(typeId: 0)
class City{

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? country;

  City(this.name, this.country);

  String toString() => "Pais: {$name}, Ciudad: {$country}";
}
