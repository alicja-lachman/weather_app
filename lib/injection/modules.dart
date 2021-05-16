import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/injection/bloc_module.dart';
import 'package:weather_app/injection/repository_module.dart';
import 'package:weather_app/networking/api_client.dart';

const String baseUrl = "https://www.metaweather.com/api";

void registerModules(GetIt injector) {
  injector.registerFactory<ApiClient>(() => ApiClient(Dio(), baseUrl));
  registerRepositoryModule(injector);
  registerBlocModule(injector);
}
