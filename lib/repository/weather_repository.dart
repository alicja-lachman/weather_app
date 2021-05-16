import 'package:weather_app/data/model/weather/weather.dart';

import '../networking/api_client.dart';

abstract class IWeatherRepository {
  Future<List<Weather>> getWeather(int woeid);
}

class WeatherRepository implements IWeatherRepository {
  final ApiClient _apiClient;

  WeatherRepository(this._apiClient);

  @override
  Future<List<Weather>> getWeather(int woeid) async {
    final response = await _apiClient.getWeather(woeid);
    return response.consolidatedWeather;
  }
}
