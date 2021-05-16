import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/weather/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/weather/weather_screen.dart';

import 'injection/bloc_factory.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<WeatherBloc>(
          create: (_) => BlocFactory.of(context).get<WeatherBloc>(),
          child: WeatherScreen()),
    );
  }
}
