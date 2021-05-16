import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/temperature_unit.dart';

class WeatherDetailsState extends Equatable {

  final int selectedIndex;
  final TemperatureUnit unit;

  const WeatherDetailsState({
    this.selectedIndex = 0,
    this.unit = TemperatureUnit.celsius,
  });

  @override
  List get props => [
        selectedIndex,
        unit,
      ];

  WeatherDetailsState copyWith({
    int? selectedIndex,
    TemperatureUnit? unit,
  }) =>
      WeatherDetailsState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        unit: unit ?? this.unit,
      );
}
