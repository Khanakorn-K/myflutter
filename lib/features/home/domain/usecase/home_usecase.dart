import 'package:myflutter/features/home/domain/entities/home_entity.dart';
import 'package:myflutter/features/home/domain/repositories/home_repository.dart';

class HomeUseCase {
  final IHomeRepository homeRepository;

  HomeUseCase({required this.homeRepository});

  Future<List<HomeEntity>> fetchHomeData() async {
    return await homeRepository.fetchHomeData();
  }
}