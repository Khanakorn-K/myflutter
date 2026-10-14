import 'package:myflutter/core/error/failures.dart';
import 'package:myflutter/features/home/data/datasource/home_datasource.dart';
import 'package:myflutter/features/home/data/mappers/home_mapper.dart';
import 'package:myflutter/features/home/domain/entities/home_entity.dart';
import 'package:myflutter/features/home/domain/repositories/home_repository.dart';

/// Concrete Repository — map Model -> Entity + map Exception -> Failure.
/// ชื่อลงท้ายด้วย Impl เพื่อไม่ให้ชนกับ abstract ฝั่ง domain.
class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl({required this.dataSource});

  @override
  Future<List<HomeEntity>> fetchHomeData() async {
    try {
      final models = await dataSource.fetchHomeData();
      return models.map((e) => e.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on FormatException catch (e) {
      throw ServerFailure(e.message);
    }
  }
}
