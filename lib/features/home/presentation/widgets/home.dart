import 'package:flutter/material.dart';
import 'package:myflutter/dependencies_Injection.dart';
import 'package:myflutter/features/home/presentation/viewModel/home_viewmodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final viewModel = sl<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.handleOnAppear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.orange,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(4),
        child: Text(
          viewModel.homeEntity?.title ?? '',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}