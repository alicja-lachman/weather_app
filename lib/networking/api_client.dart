import 'package:dio/dio.dart';
import 'package:weather_app/data/model/weather_api_response/weather_api_response.dart';

class ApiClient {
  final Dio dio;
  final String baseUrl;

  ApiClient(this.dio, this.baseUrl) {
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 5000
      ..options.receiveTimeout = 3000;
  }

  Future<WeatherApiResponse> getWeather(int woeid) async {
    Response response = await dio.get("/location/$woeid/");
    return WeatherApiResponse.fromJson(response.data);
  }
}
