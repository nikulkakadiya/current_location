class Weather{
  String? city;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;
  double? feels_like;
  String? cntry;

  Weather({
    this.city,
    this.temp,
    this.wind,
    this.humidity,
    this.pressure,
    this.feels_like,
    this.cntry,
  });

  Weather.fromJson(Map<String, dynamic> json){
    city = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    feels_like = json["main"]["feels_like"];
    cntry = json["sys"]["country"];
  }
}