import 'package:flutter/material.dart';

@immutable
abstract class WeatherEvent {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {
  final int woeid;

  FetchWeather(this.woeid);
}
