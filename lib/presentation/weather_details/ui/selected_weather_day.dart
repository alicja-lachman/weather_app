import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/model/temperature_unit.dart';
import 'package:weather_app/data/model/weather/weather.dart';
import 'package:weather_app/util/temperature_unit_util.dart';

class SelectedWeatherDay extends StatelessWidget {
  final Weather weather;
  final TemperatureUnit unit;

  const SelectedWeatherDay(
      {Key? key, required this.weather, required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(height: 16),
        Text(
          DateFormat('EEEE').format(DateTime.parse(weather.applicableDate)),
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            weather.weatherStateName,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(height: 16),
        SvgPicture.network(
          'https://www.metaweather.com/static/img/weather/${weather.weatherStateAbbr}.svg',
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width * 0.4,
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ),
        SizedBox(height: 16),
        Text(TemperatureUnitUtil.getDisplayedTemperature(weather.theTemp, unit),
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Humidity: ${weather.humidity.toString()}%",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              "Pressure: ${weather.airPressure.toString()} hPa",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              "Wind: ${weather.windSpeed.toStringAsFixed(2)} km/h",
              style: TextStyle(fontSize: 18),
            ),
          ]),
        ),
      ]),
    );
  }
}
