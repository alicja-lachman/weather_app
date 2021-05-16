import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/weather_details/bloc/weather_details_event.dart';
import 'package:weather_app/presentation/weather_details/bloc/weather_details_state.dart';

class WeatherDetailsBloc
    extends Bloc<WeatherDetailsEvent, WeatherDetailsState> {
  WeatherDetailsBloc() : super(WeatherDetailsState());

  @override
  Stream<WeatherDetailsState> mapEventToState(
      WeatherDetailsEvent event) async* {
    if (event is SelectDay) {
      yield state.copyWith(selectedIndex: event.index);
    } else if (event is SelectUnit) {
      yield state.copyWith(unit: event.temperatureUnit);
    }
  }
}
