import 'package:flutter/material.dart';
import 'package:myflutter/dependencies_Injection.dart';
import 'package:myflutter/features/home/presentation/widgets/home.dart';

void main() {
  setupLocator();
  runApp(MaterialApp(
    title: 'khanakorn App',
    home: Scaffold(
      appBar: AppBar(
        title: const Text("khanakorn"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: const Home(),
    ),
  ));
}
