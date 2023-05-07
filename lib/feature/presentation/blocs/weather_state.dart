part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.fetched(
      {required WeatherResponseModel weatherResponseModel}) = _Fetched;
  const factory WeatherState.failed({required String message}) = _Failed;
}
