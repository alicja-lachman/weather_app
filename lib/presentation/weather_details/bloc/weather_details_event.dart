import 'package:flutter/material.dart';
import 'package:weather_app/data/model/temperature_unit.dart';

@immutable
abstract class WeatherDetailsEvent {
  const WeatherDetailsEvent();
}

class SelectDay extends WeatherDetailsEvent {
  final int index;

  SelectDay(this.index);
}

class SelectUnit extends WeatherDetailsEvent {
  final TemperatureUnit temperatureUnit;

  SelectUnit(this.temperatureUnit);
}
