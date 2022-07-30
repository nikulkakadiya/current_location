import 'package:flutter/material.dart';

import 'package:wheather_app/services/weather_api.dart';
// import 'package:wheather_app/widgets/additional_information.dart';
import 'package:wheather_app/widgets/current_weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'model/weather_model.dart';

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

  bool isLoading=false;
  final _cityTextController=TextEditingController();
  final _dataService=DetaService();
  WeatherResponse? _response;
  // final String city="ahmedabad";

  Future<void> _search() async {
    final response=await _dataService.getWeather(_cityTextController.text);
    setState(()=>_response=response);
    // print(_response!.systemInfo!.country);
  }

  @override
  Widget build(BuildContext context) {

    final city=TextFormField(

      autofocus: false,
      controller:_cityTextController,
      keyboardType: TextInputType.name,

      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "City",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

    );


    final submitButton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          _search();
        },
        child: Text("Submit",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );

    final submitButton1=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
            setState(() {
              isLoading=true;
            });
        },
        child: isLoading?CircularProgressIndicator(color: Colors.blue): Text("Submit",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );
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
          // future: _search(),
          builder: (context, snapshot) {
            return Column(
              children: <Widget>[
                if(_response!=null)
                  Column(
                    children: [
                      Image.network('${_response!.iconUrl}'),
                      const SizedBox(height: 2,),
                      Text('${_response!.weatherInfo!.main}',
                        style: const TextStyle(
                            fontSize: 20
                        ),
                      ),
                      currentWeather('${_response!.tempInfo!.temperatur}','${_response!.cityName}','${_response!.weatherInfo!.description}','${_response!.systemInfo!.country}'),
                    ],
                  ),

                city,
                SizedBox(height: 10),
                submitButton,
                SizedBox(height: 10),
                // submitButton1,
                // SizedBox(height: 10),



              ],
            );
          },
        )
    );
  }
}
