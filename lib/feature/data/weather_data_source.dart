import 'package:dio/dio.dart';
import 'package:weatherapp/core/base_data_source.dart';
import 'package:weatherapp/feature/data/models/weather_response_model.dart';

class WeatherDataSource extends BaseRemoteSource {
  Future<WeatherResponseModel> getWeather(String city) async {
    return networkHandler(
        request: (Dio dio) => dio.get(
              "https://api.openweathermap.org/data/2.5/weather?APPID=d1620a273527c62af41fc964f16ccb46&units=metric&q=$city,NP&lang=en",
            ),
        onResponse: (Map<String, dynamic> data) {
          return WeatherResponseModel.fromJson(data);
        });
  }
}
