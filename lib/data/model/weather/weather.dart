import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final int id;
  @JsonKey(name: "applicable_date")
  final String applicableDate;
  @JsonKey(name: "weather_state_name")
  final String weatherStateName;
  @JsonKey(name: "weather_state_abbr")
  final String weatherStateAbbr;
  @JsonKey(name: "wind_speed")
  final double windSpeed;
  @JsonKey(name: "wind_direction")
  final double windDirection;
  @JsonKey(name: "min_temp")
  final double minTemp;
  @JsonKey(name: "max_temp")
  final double maxTemp;
  @JsonKey(name: "air_pressure")
  final double airPressure;
  @JsonKey(name: "the_temp")
  final double theTemp;
  final double humidity;

  Weather({
    required this.id,
    required this.applicableDate,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windSpeed,
    required this.windDirection,
    required this.minTemp,
    required this.maxTemp,
    required this.airPressure,
    required this.theTemp,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
