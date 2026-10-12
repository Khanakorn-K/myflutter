import 'package:flutter/material.dart';
import 'package:myflutter/features/home/domain/entities/home_entity.dart';
import 'package:myflutter/features/home/domain/usecase/home_usecase.dart';

class HomeViewModel {
  HomeEntity? homeEntity;
  final HomeUseCase homeUseCase;

  HomeViewModel({required this.homeUseCase});

  Future<void> handleOnAppear() async {
    try {
      final value = await homeUseCase.fetchHomeData();
      if (value.isNotEmpty) {
        homeEntity = value.first;
      }
    }
    catch (e) {
      debugPrint(e.toString());
    }
  }
}
