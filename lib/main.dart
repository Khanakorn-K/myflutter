import 'package:flutter/material.dart';
import 'package:myflutter/app.dart';
import 'package:myflutter/dependencies_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}
