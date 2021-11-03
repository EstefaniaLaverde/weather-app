class WeatherInfo {
  String? coord;
  String? weather;
  String? base;
  String? main;
  int? visibility;
  String? wind;
  String? clouds;
  int? dt;
  String? sys;
  int? timezone;
  int? id;
  String? name;
  String? cod;

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
    coord = json['coord'];
    weather = json["weather"];
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coord'] = coord;
    data["weather"] = weather;
    data["base"] = base;
    data["main"] = main;
    data["visibility"] = visibility;
    data["wind"] = wind;
    data["clouds"] = clouds;
    data["dt"] = dt;
    data["sys"] = sys;
    data["timezone"] = timezone;
    data["id"] = id;
    data["name"] = name;
    data["code"] = coord;

    return data;
  }
}
