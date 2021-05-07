import 'dart:convert';

List<Temp> tempFromJson(String str) => List<Temp>.from(json.decode(str).map((x) => Temp.fromMap(x)));

String TempToJson(List<Temp> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Temp{
  int id;
  int temperature;
  int humidity;
  String date;

  Temp({
    this.id,
    this.temperature,
    this.date,
    this.humidity,
  });
  factory Temp.fromMap(Map<String, dynamic> json)=> Temp(
    id: json["id"],
    temperature: json["temperature"],
    humidity: json["humidity"],
    date: json["date"],
  );
  Map<String, dynamic> toMap() => {
    "id":id,
    "temperature":temperature,
    "humidity":humidity,
    "date":date,

  };

}










