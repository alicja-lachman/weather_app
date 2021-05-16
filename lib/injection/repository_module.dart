import 'package:get_it/get_it.dart';
import 'package:weather_app/repository/weather_repository.dart';

void registerRepositoryModule(GetIt injector) {
  injector.registerFactory<IWeatherRepository>(
      () => WeatherRepository(injector.get()));
}
