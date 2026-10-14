import 'package:flutter/material.dart';
import 'package:myflutter/app.dart';
import 'package:myflutter/DI/home_dependencies_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  homeSetupLocator();
  runApp(const MyApp());
}
