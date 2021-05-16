import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/model/temperature_unit.dart';
import 'package:weather_app/presentation/weather_details/bloc/weather_details_bloc.dart';
import 'package:weather_app/presentation/weather_details/bloc/weather_details_event.dart';
import 'package:weather_app/presentation/weather_details/bloc/weather_details_state.dart';

void main() {
  group('WeatherDetailsBloc', () {
    blocTest<WeatherDetailsBloc, WeatherDetailsState>(
      'emits nothing at startup',
      build: () => WeatherDetailsBloc(),
      expect: () => [],
    );

    blocTest<WeatherDetailsBloc, WeatherDetailsState>(
      'emits selected index and default unit: celsius',
      build: () => WeatherDetailsBloc(),
      act: (bloc) => bloc.add(SelectDay(2)),
      expect: () => [
        WeatherDetailsState(selectedIndex: 2, unit: TemperatureUnit.celsius)
      ],
    );

    blocTest<WeatherDetailsBloc, WeatherDetailsState>(
      'emits default index and selected unit: fahrenheit',
      build: () => WeatherDetailsBloc(),
      act: (bloc) => bloc.add(SelectUnit(TemperatureUnit.fahrenheit)),
      expect: () => [
        WeatherDetailsState(selectedIndex: 0, unit: TemperatureUnit.fahrenheit)
      ],
    );

    blocTest<WeatherDetailsBloc, WeatherDetailsState>(
      'emits in order selected index and selected unit: fahrenheit',
      build: () => WeatherDetailsBloc(),
      act: (bloc) =>
          bloc..add(SelectDay(3))..add(SelectUnit(TemperatureUnit.fahrenheit)),
      expect: () => [
        WeatherDetailsState(selectedIndex: 3, unit: TemperatureUnit.celsius),
        WeatherDetailsState(selectedIndex: 3, unit: TemperatureUnit.fahrenheit)
      ],
    );
  });
}
