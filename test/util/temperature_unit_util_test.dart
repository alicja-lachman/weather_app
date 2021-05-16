import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/model/temperature_unit.dart';
import 'package:weather_app/util/temperature_unit_util.dart';

void main() {
  group('Celsius temperature', () {
    test('Positive integer temperature in Celsius should not be changed', () {
      final double tempInC = 37;

      final String displayedTempInC =
          TemperatureUnitUtil.getDisplayedTemperature(
              tempInC, TemperatureUnit.celsius);

      expect(displayedTempInC, "37°");
    });
    test('Positive temperature in Celsius should be rounded', () {
      final double tempInC = 17.7;

      final String displayedTempInC =
          TemperatureUnitUtil.getDisplayedTemperature(
              tempInC, TemperatureUnit.celsius);

      expect(displayedTempInC, "18°");
    });
    test('Negative integer temperature in Celsius should not be changed', () {
      final double tempInC = -37;

      final String displayedTempInC =
          TemperatureUnitUtil.getDisplayedTemperature(
              tempInC, TemperatureUnit.celsius);

      expect(displayedTempInC, "-37°");
    });
    test('Negative temperature in Celsius should be rounded', () {
      final double tempInC = -17.7;

      final String displayedTempInC =
          TemperatureUnitUtil.getDisplayedTemperature(
              tempInC, TemperatureUnit.celsius);

      expect(displayedTempInC, "-18°");
    });
    test(
        'Negative min and negative max temperature in Celsius should be rounded',
        () {
      final double minTempInC = -17.7;
      final double maxTempInC = -2.8;
      final String displayedTempRangeInC =
          TemperatureUnitUtil.getDisplayedTemperaturesRange(
              minTempInC, maxTempInC, TemperatureUnit.celsius);

      expect(displayedTempRangeInC, "-18°/-3°");
    });
    test(
        'Negative min and positive max temperature in Celsius should be rounded',
        () {
      final double minTempInC = -17.7;
      final double maxTempInC = 4.8;
      final String displayedTempRangeInC =
          TemperatureUnitUtil.getDisplayedTemperaturesRange(
              minTempInC, maxTempInC, TemperatureUnit.celsius);

      expect(displayedTempRangeInC, "-18°/5°");
    });
    test(
        'Positive min and positive max temperature in Celsius should be rounded',
        () {
      final double minTempInC = 2.2;
      final double maxTempInC = 14.8;
      final String displayedTempRangeInC =
          TemperatureUnitUtil.getDisplayedTemperaturesRange(
              minTempInC, maxTempInC, TemperatureUnit.celsius);

      expect(displayedTempRangeInC, "2°/15°");
    });
  });
  group('Fahrenheit temperature', () {
    test('Positive integer temperature in Fahrenheit should be converted', () {
      final double tempInC = 37;

      final String displayedTempInF =
          TemperatureUnitUtil.getDisplayedTemperature(
              tempInC, TemperatureUnit.fahrenheit);

      expect(displayedTempInF, "99F");
    });
    test('Positive temperature in Fahrenheit should be converted and rounded',
        () {
      final double tempInC = 17.7;

      final String displayedTempInF =
          TemperatureUnitUtil.getDisplayedTemperature(
              tempInC, TemperatureUnit.fahrenheit);

      expect(displayedTempInF, "64F");
    });
    test('Negative temperature in Fahrenheit should be converted', () {
      final double tempInC = -37;

      final String displayedTempInF =
          TemperatureUnitUtil.getDisplayedTemperature(
              tempInC, TemperatureUnit.fahrenheit);

      expect(displayedTempInF, "-35F");
    });
    test('Negative temperature in Fahrenheit should be converted and rounded',
        () {
      final double tempInC = -17.7;

      final String displayedTempInF =
          TemperatureUnitUtil.getDisplayedTemperature(
              tempInC, TemperatureUnit.fahrenheit);

      expect(displayedTempInF, "0F");
    });
    test(
        'Negative min and negative max temperature in Fahrenheit should be converted and rounded',
        () {
      final double minTempInC = -17.7;
      final double maxTempInC = -2.8;
      final String displayedTempRangeInF =
          TemperatureUnitUtil.getDisplayedTemperaturesRange(
              minTempInC, maxTempInC, TemperatureUnit.fahrenheit);

      expect(displayedTempRangeInF, "0F/27F");
    });
    test(
        'Negative min and positive max temperature in Fahrenheit should be converted and rounded',
        () {
      final double minTempInC = -17.7;
      final double maxTempInC = 4.8;
      final String displayedTempRangeInF =
          TemperatureUnitUtil.getDisplayedTemperaturesRange(
              minTempInC, maxTempInC, TemperatureUnit.fahrenheit);

      expect(displayedTempRangeInF, "0F/41F");
    });
    test(
        'Positive min and positive max temperature string in Fahrenheit should be converted and rounded',
        () {
      final double minTempInC = 2.2;
      final double maxTempInC = 14.8;
      final String displayedTempRangeInF =
          TemperatureUnitUtil.getDisplayedTemperaturesRange(
              minTempInC, maxTempInC, TemperatureUnit.fahrenheit);

      expect(displayedTempRangeInF, "36F/59F");
    });
  });
}
