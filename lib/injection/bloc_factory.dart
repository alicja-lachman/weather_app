import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class BlocFactory {
  final GetIt injector;

  const BlocFactory({
    required this.injector,
  });

  T get<T extends Bloc>() => injector.get<T>();

  static BlocFactory of(BuildContext context) =>
      Provider.of<BlocFactory>(context);
}
