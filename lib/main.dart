import 'package:flutter/material.dart';
import 'package:hungry/core/dataSources/local/preference_manager.dart';
import 'core/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager.init();
  runApp(const MyApp());
}
