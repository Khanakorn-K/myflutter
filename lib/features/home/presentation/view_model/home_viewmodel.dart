import 'package:flutter/material.dart';
import 'package:myflutter/core/error/failures.dart';
import 'package:myflutter/core/usecase/usecase.dart';
import 'package:myflutter/features/home/domain/entities/home_entity.dart';
import 'package:myflutter/features/home/domain/usecase/home_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeUseCase homeUseCase;

  HomeViewModel({required this.homeUseCase});

  List<HomeEntity> _items = const [];
  List<HomeEntity> get items => _items;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> handleOnAppear() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _items = await homeUseCase.execute(const NoParams());
    } on Failure catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
