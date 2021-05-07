import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('JSON ListView in Flutter')
        ),
        body: JsonListView(),
      ),
    );
  }
}

class Fruitdata {
  int id;
  int temperature;
  int humidity;
  String date;

  Fruitdata(  {
    this.id,
    this.temperature,
    this.humidity,
    this.date,
  });

  factory Fruitdata.fromJson(Map<String, dynamic> json) {
    return Fruitdata(
      id: json['id'],
      temperature: json["temperature"],
      humidity: json["humidity"],
      date: json["date"],

    );
  }
}

class JsonListView extends StatefulWidget {

  JsonListViewWidget createState() => JsonListViewWidget();

}

class JsonListViewWidget extends State<JsonListView> {
  _getData() async{
    final response = await http.get('https://api.myjson.com/bins/16e68w');
    Map<String,dynamic> map = json.decode(response.body);
    return map;
  }


  Future<List<Fruitdata>> fetchFruits() async {
    var uri = "http://192.168.1.14/stage/temp.php";
    var response = await http.get(uri);
    if (response.statusCode == 200) {

      final items = json.decode(response.body);
      print(items);
      print(items.length);


      List<Fruitdata> listOfFruits= items.map<Fruitdata>((json) {
        return Fruitdata.fromJson(json);
      }).toList();

      return listOfFruits;
    }
    else {
      throw Exception('Failed to load data.');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
            child: SingleChildScrollView(
                child: Form(
                    child: Column(
                      children: <Widget>[
                        Container(margin: EdgeInsets.only(top: 10),
                          width: 350,
                          height: 300,
                          child: FutureBuilder<List<Fruitdata>>(
                            future: fetchFruits(),
                            builder: (context, snapshot) {

                              if (!snapshot.hasData)
                                return Center(
                                  child: CircularProgressIndicator()
                              );

                              return ListView(
                                children: snapshot.data
                                    .map((data) => ListTile(
                                  title: Text(data.date.toString()),
                                  subtitle: Text(data.temperature.toString()),
                                  onTap: (){print(data.temperature);},
                                ))
                                    .toList(),
                              );
                            },
                          ),),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          width: 300,height: 300,
                          child: FutureBuilder(
                              future:fetchFruits() ,
                              builder: (BuildContext context,AsyncSnapshot snapshot){
                                if(snapshot.connectionState == ConnectionState.done)
                                  return new charts.PieChart(
                                      dataList(snapshot.data),
                                      defaultRenderer: new charts.ArcRendererConfig(
                                          arcRendererDecorators: [new charts.ArcLabelDecorator()])
                                  );
                                else
                                  return Center(child: CircularProgressIndicator());
                              }
                          ),
                        )


                      ],)))));
  }

  static List<charts.Series<LinearSales, int>> dataList(Map<String, dynamic> apiData) {
    List<LinearSales> list = new List();

    for(int i=0; i<apiData['temperature'].length; i++)
      list.add(new LinearSales(i, apiData['temperature'][i]));

    return [
      new charts.Series<LinearSales, int>(
        id: 'id',
        domainFn: (LinearSales sales, _) => sales.temperature,
        measureFn: (LinearSales sales, _) => sales.id,
        data: list,
        labelAccessorFn: (LinearSales row, _) => '${row.temperature}: ${row.id}',
      )
    ];
  }
}

class LinearSales {
  int temperature;
  int id;
  LinearSales(this.temperature, this.id);
}




