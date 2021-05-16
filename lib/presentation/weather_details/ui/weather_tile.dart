import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/model/temperature_unit.dart';
import 'package:weather_app/data/model/weather/weather.dart';
import 'package:weather_app/util/temperature_unit_util.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather;
  final bool isSelected;
  final TemperatureUnit unit;

  WeatherTile(
      {required this.weather, required this.isSelected, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(
                color:
                    isSelected ? Colors.blue : Colors.grey.withOpacity(0.5))),
        width: MediaQuery.of(context).size.width / 3,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormat('EE').format(DateTime.parse(weather.applicableDate)),
              ),
              Spacer(),
              SvgPicture.network(
                'https://www.metaweather.com/static/img/weather/${weather.weatherStateAbbr}.svg',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width / 8,
                placeholderBuilder: (BuildContext context) =>
                    Container(child: const CircularProgressIndicator()),
              ),
              Spacer(),
              Text(TemperatureUnitUtil.getDisplayedTemperaturesRange(
                  weather.minTemp, weather.maxTemp, unit)),
            ],
          ),
        ));
  }
}
