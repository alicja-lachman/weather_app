import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/model/weather/weather.dart';

part 'weather_api_response.g.dart';

@JsonSerializable()
class WeatherApiResponse {
  @JsonKey(name: "consolidated_weather")
  final List<Weather> consolidatedWeather;

  WeatherApiResponse({required this.consolidatedWeather});

  factory WeatherApiResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherApiResponseToJson(this);
}
