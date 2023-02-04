import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/core/bloc/app_bloc_observer.dart';
import 'package:netgeek/core/injection/injection.dart';
import 'package:netgeek/core/widget/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();

  runApp(const App());
}

Future<void> _initServices() async {
  await configureInjection(Environment.prod);
  Bloc.observer = AppBlocObserver();
}

abstract class Category {
  String getCategoryName();

  void displayCategory();
}

abstract class Payment{

}