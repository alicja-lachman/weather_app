import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/weather/weather.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});

  @override
  List<Object?> get props => [message];
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<Weather> weatherList;

  WeatherLoaded({required this.weatherList});

  @override
  List<Object?> get props => [weatherList];
}
