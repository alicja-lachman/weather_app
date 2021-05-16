import 'package:get_it/get_it.dart';
import 'package:weather_app/presentation/weather/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/weather_details/bloc/weather_details_bloc.dart';

void registerBlocModule(GetIt injector) {
  injector.registerFactory(() => WeatherBloc(injector.get()));
  injector.registerFactory(() => WeatherDetailsBloc());
}
