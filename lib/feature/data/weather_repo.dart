import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/base_repository.dart';
import 'package:weatherapp/feature/data/models/weather_response_model.dart';

import 'weather_data_source.dart';

class WeatherRepo extends BaseRepository {
  WeatherRepo(this._dataSource);

  late final WeatherDataSource _dataSource;

  Future<Either<String?, WeatherResponseModel>> getWeather(String city) async {
    return handleNetworkCall<WeatherResponseModel, WeatherResponseModel>(
        apiCall: _dataSource.getWeather(city), onSuccess: (data) => data);
  }
}
