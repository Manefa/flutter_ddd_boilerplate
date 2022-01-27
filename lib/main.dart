import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/core/platforms/local_storage/local_storage.dart';

import './src/injector.dart' as i;

import './src/core/app.dart';


// TODO: Change app name in manifest
// TODO: Change app name in runner
// TODO: change app name in core/app.dart
// TODO: change bundle id

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await i.initializeDependencies();

  await i.injector<LocalStorage>().init();

  runApp(const App());
}
