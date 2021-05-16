import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_app.dart';

import 'injection/bloc_factory.dart';
import 'injection/modules.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt injector = GetIt.instance;
  registerModules(injector);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
      providers: [
        Provider<BlocFactory>(
            create: (context) => BlocFactory(injector: injector)),
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (BuildContext context) {
          return WeatherApp();
        },
      ),
    ));
  });
}
