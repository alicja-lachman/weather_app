import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/model/temperature_unit.dart';
import 'package:weather_app/data/model/weather/weather.dart';
import 'package:weather_app/presentation/weather_details/bloc/weather_details_event.dart';
import 'package:weather_app/presentation/weather_details/ui/selected_weather_day.dart';
import 'package:weather_app/presentation/weather_details/ui/weather_tile.dart';

import 'bloc/weather_details_bloc.dart';
import 'bloc/weather_details_state.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final List<Weather> weatherList;
  final Function() refreshCallback;

  WeatherDetailsWidget(
      {Key? key, required this.weatherList, required this.refreshCallback})
      : super(key: key);

  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherDetailsBloc, WeatherDetailsState>(
        builder: (context, state) {
      return RefreshIndicator(
          key: _refreshKey,
          onRefresh: () async => refreshCallback(),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return ListView(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _UnitToggleButtons(unit: state.unit),
                  ],
                ),
                SelectedWeatherDay(
                    weather: weatherList[state.selectedIndex],
                    unit: state.unit),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                      key: PageStorageKey<String>('key'),
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: weatherList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () =>
                                BlocProvider.of<WeatherDetailsBloc>(context)
                                    .add(SelectDay(index)),
                            child: WeatherTile(
                                weather: weatherList[index],
                                isSelected: index == state.selectedIndex,
                                unit: state.unit),
                          )),
                )
              ]);
            },
          ));
    });
  }
}

class _UnitToggleButtons extends StatelessWidget {
  final TemperatureUnit unit;

  const _UnitToggleButtons({
    Key? key,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        children: [
          Text('°C'),
          Text('F'),
        ],
        onPressed: (index) => BlocProvider.of<WeatherDetailsBloc>(context)
            .add(SelectUnit(TemperatureUnit.values[index])),
        isSelected: List.generate(TemperatureUnit.values.length,
            (index) => unit == TemperatureUnit.values[index]));
  }
}
