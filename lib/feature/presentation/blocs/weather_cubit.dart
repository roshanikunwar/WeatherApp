import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherapp/core/base_bloc.dart';
import 'package:weatherapp/feature/data/models/weather_response_model.dart';
import 'package:weatherapp/feature/data/weather_repo.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';


class WeatherCubit extends Cubit<WeatherState> with BaseBlocMixin {
  WeatherCubit(this._weatherRepo) : super(const WeatherState.initial());

  late final WeatherRepo _weatherRepo;

  Future<void> fetchWeather(String city) async {
    handleBlocData<WeatherResponseModel>(
        response: await _weatherRepo.getWeather(city),
        onData: (data) {
          emit(WeatherState.fetched(weatherResponseModel: data));
        },
        onFailure: (String? error) {
          emit(WeatherState.failed(message: error!));
        });
  }
}
