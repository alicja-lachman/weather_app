import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/injection/bloc_factory.dart';
import 'package:weather_app/presentation/weather_details/bloc/weather_details_bloc.dart';
import 'package:weather_app/presentation/weather_details/weather_details_widget.dart';

import 'bloc/weather_bloc.dart';
import 'bloc/weather_event.dart';
import 'bloc/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    BlocProvider.of<WeatherBloc>(context).add(FetchWeather(638242));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in Berlin'),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) return _LoadingWeatherWidget();
        if (state is WeatherError)
          return _ErrorWeatherWidget(
              refreshCallback: _fetchData, message: state.message);
        if (state is WeatherLoaded)
          return BlocProvider<WeatherDetailsBloc>(
              create: (_) => BlocFactory.of(context).get<WeatherDetailsBloc>(),
              child: WeatherDetailsWidget(
                weatherList: state.weatherList,
                refreshCallback: _fetchData,
              ));
        return Column(
          children: [Text('Weather app')],
        );
      }),
    );
  }
}

class _ErrorWeatherWidget extends StatelessWidget {
  final Function() refreshCallback;
  final String? message;

  const _ErrorWeatherWidget(
      {Key? key, required this.refreshCallback, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message ?? "Unknown error happened"),
          ElevatedButton(
              onPressed: refreshCallback,
              child: Text(
                "Try again",
              ))
        ],
      ),
    );
  }
}

class _LoadingWeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
