
class WeatherInfo {

  Map<String,dynamic>? coord;
  Map<String,dynamic>? weather;
  String? base;
  Map<String,dynamic>? main;
  int? visibility;
  Map<String,dynamic>? wind;
  Map<String,dynamic>? clouds;
  int? dt;
  Map<String,dynamic>? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherInfo({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  WeatherInfo.fromJson(Map<String, dynamic> json) {

    coord = json["coord"];
    weather = json["weather"][0];
    base = json["base"];
    main = json["main"];
    visibility = json["visibility"];
    wind = json["wind"];
    clouds = json["clouds"];
    dt = json["dt"];
    sys = json["sys"];
    timezone = json["timezone"];
    id = json["id"];
    name = json["name"];
    cod = json["code"];

  }

  String get temperature => main!['temp'].toString();
  String get sensation => main!['feels_like'].toString();
  String get tempMin => main!['temp_min'].toString();
  String get tempMax => main!['tempMax'].toString();
  String get pressure => main!['pressure'].toString();
  String get humidity => main!['humidity'].toString();

  String get weatherDescription => weather!['description'];



}
