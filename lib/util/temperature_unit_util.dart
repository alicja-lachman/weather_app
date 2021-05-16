import 'package:weather_app/data/model/temperature_unit.dart';

class TemperatureUnitUtil {
  static String getDisplayedTemperature(double value, TemperatureUnit unit) {
    if (unit == TemperatureUnit.celsius)
      return "${value.round()}°";
    else
      return "${_getTempInFahrenheit(value).round()}F";
  }

  static double _getTempInFahrenheit(double value) {
    return value * 9 / 5 + 32;
  }

  static String getDisplayedTemperaturesRange(
      double minValue, double maxValue, TemperatureUnit unit) {
    return "${getDisplayedTemperature(minValue, unit)}/${getDisplayedTemperature(maxValue, unit)}";
  }
}
