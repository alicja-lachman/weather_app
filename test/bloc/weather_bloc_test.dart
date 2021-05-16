import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/data/model/weather/weather.dart';
import 'package:weather_app/presentation/weather/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/weather/bloc/weather_event.dart';
import 'package:weather_app/presentation/weather/bloc/weather_state.dart';
import 'package:weather_app/repository/weather_repository.dart';

class MockWeather extends Mock implements Weather {}

class MockIWeatherRepository extends Mock implements IWeatherRepository {}

void main() {
  group('WeatherBloc', () {
    late IWeatherRepository repository;
    List<Weather> weatherList = [MockWeather(), MockWeather()];
    int woeid = 1234;

    setUp(() {
      repository = MockIWeatherRepository();
      when(() => repository.getWeather(any()))
          .thenAnswer((_) => Future<List<Weather>>.value(weatherList));
    });

    blocTest<WeatherBloc, WeatherState>(
      'emits nothing at startup',
      build: () => WeatherBloc(repository),
      expect: () => [],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits list of weathers when FetchWeather is added',
      build: () => WeatherBloc(repository),
      act: (bloc) => bloc.add(FetchWeather(woeid)),
      expect: () => [WeatherLoaded(weatherList: weatherList)],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits loading and list of weathers when FetchWeather is added after error',
      build: () => WeatherBloc(repository)..emit(WeatherError(message: "")),
      act: (bloc) => bloc.add(FetchWeather(woeid)),
      expect: () => [WeatherLoading(), WeatherLoaded(weatherList: weatherList)],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits error when FetchWeather is added and repository fails',
      build: () {
        when(() => repository.getWeather(any())).thenThrow(Exception());
        return WeatherBloc(repository);
      },
      act: (bloc) => bloc.add(FetchWeather(woeid)),
      expect: () => [WeatherError(message: "Something went wrong")],
    );
  });
}
