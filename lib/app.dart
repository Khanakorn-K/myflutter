import 'package:flutter/material.dart';
import 'package:myflutter/DI/home_dependencies_injection.dart';
import 'package:myflutter/features/home/presentation/view_model/home_viewmodel.dart';
import 'package:myflutter/menu_bar.dart';

// หมายเหตุ: ไม่มี main() ในไฟล์นี้ — entry ของแอปคือ lib/main.dart
// (เรียก setupLocator แล้วค่อย runApp MyApp ตัวนี้).

/// MyApp เป็นเจ้าของ HomeViewModel ตัวเดียว ส่งต่อลงไปให้หน้าลูก.
/// สร้างครั้งเดียวใน State ห้ามสร้างใน build.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _homeViewModel = sl<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    _homeViewModel.handleOnAppear();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crystal Navigation Bar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: App(homeViewModel: _homeViewModel),
    );
  }
}

class App extends StatefulWidget {
  final HomeViewModel homeViewModel;

  const App({super.key, required this.homeViewModel});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MenuBarMain(homeViewModel: widget.homeViewModel);
  }
}
