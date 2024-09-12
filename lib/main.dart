import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/core/utils/log_bloc_observer.dart';

import 'injector_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  await init();

  runApp(const App());
}
