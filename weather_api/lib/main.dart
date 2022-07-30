import 'package:flutter/material.dart';
import 'package:weather_api/model/weather_model.dart';
import 'package:weather_api/services/weather_api.dart';
import 'package:weather_api/widgets/additional_information.dart';
import 'package:weather_api/widgets/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  WeatherApi weather = WeatherApi();
  Weather? data;

  Future<void> getData() async{
    data = await weather.getCurrentWeather("Ahmedabad");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf9f9f9),
        title: const Text("Weather",
          style: TextStyle(
              color: Colors.black
          ),
        ),
        centerTitle: true,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: (){
        //
        //   },
        //   icon: const Icon(Icons.menu),
        //   color: Colors.black,
        // ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              currentWeather(Icons.wb_sunny_rounded, "${data!.temp}", "${data!.city}","${data!.cntry}"),
              const SizedBox(height: 20,),
              const Text("Additional Information",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xdd212121),
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const Divider(),
              const SizedBox(height: 20,),
              additionalInformation("${data!.wind}", "${data!.humidity}", "${data!.pressure}", "${data!.feels_like}"),
              // const Divider(),
            ],
          );
        },
      )
    );
  }
}
