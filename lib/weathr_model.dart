class Wether{
  double temp_c;
  double lat;
  double lon;
  double wnd_spd;
  int humdty;
  String condition;
  String timee;
  String icn;

  Wether({
    this.temp_c=0,
    this.lat=0,
    this.lon=0,
    this.condition='Sunny',
    this.timee='2011-04-17',
    this.icn='https://cdn.weatherapi.com/weather/64x64/day/143.png',
    this.wnd_spd=0,
    this.humdty=0,
});

  factory Wether.fromJson(Map<String,dynamic>json){
    return Wether(
      temp_c: json["current"]["temp_c"],
      lat: json["location"]["lat"],
      lon: json["location"]["lon"],
      condition: json["current"]["condition"]["text"],
      timee: json["location"]["localtime"],
      icn: json["current"]["condition"]["icon"],
      wnd_spd: json["current"]["wind_kph"],
      humdty: json["current"]["humidity"],
    );
  }
}