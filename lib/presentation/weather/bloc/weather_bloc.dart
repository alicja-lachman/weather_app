import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/model/weather/weather.dart';
import 'package:weather_app/presentation/weather/bloc/weather_event.dart';
import 'package:weather_app/presentation/weather/bloc/weather_state.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherLoading());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      try {
        if (state is WeatherError) yield WeatherLoading();
        final List<Weather> weatherList =
            await _weatherRepository.getWeather(event.woeid);
        yield WeatherLoaded(weatherList: weatherList);
      } on DioError catch (error) {
        if (error.error is SocketException)
          yield WeatherError(message: "Please check your Internet connection!");
        else
          yield WeatherError(message: "Something went wrong");
      } on Exception catch (_) {
        yield WeatherError(message: "Something went wrong");
      }
    }
  }
}
