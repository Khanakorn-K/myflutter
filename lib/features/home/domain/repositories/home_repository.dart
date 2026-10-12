import 'package:myflutter/features/home/domain/entities/home_entity.dart';

abstract class IHomeRepository {
  Future<List<HomeEntity>> fetchHomeData();
}