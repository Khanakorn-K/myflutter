import 'package:myflutter/core/usecase/usecase.dart';
import 'package:myflutter/features/home/domain/entities/home_entity.dart';
import 'package:myflutter/features/home/domain/repositories/home_repository.dart';

class HomeUseCase extends UseCase<List<HomeEntity>, NoParams> {
  final HomeRepository homeRepository;

  HomeUseCase({required this.homeRepository});

  @override
  Future<List<HomeEntity>> execute(NoParams params) {
    return homeRepository.fetchHomeData();
  }
}
