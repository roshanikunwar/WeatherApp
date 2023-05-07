import 'package:flutter/material.dart';
import 'package:weatherapp/feature/data/models/weather_response_model.dart';

class ShowWeather extends StatelessWidget {
  final WeatherResponseModel weatherResponseModel;
  final String cityName;

  const ShowWeather({
    super.key,
    required this.weatherResponseModel,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Container(
            padding: const EdgeInsets.only(right: 32, left: 32, top: 10),
            child: Column(children: <Widget>[
              Text(
                cityName,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${weatherResponseModel.main?.temp}C",
                style: const TextStyle(color: Colors.white70, fontSize: 50),
              ),
              const Text(
                "Temprature",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "${weatherResponseModel.main?.tempMax}C",
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 30),
                      ),
                      const Text(
                        "Min Temprature",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "${weatherResponseModel.main?.tempMin}C",
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 30),
                      ),
                      const Text(
                        "Max Temprature",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ])),
      ),
    );
  }
}
