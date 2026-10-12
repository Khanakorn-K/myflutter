import 'package:myflutter/features/home/data/datasource/home_datasource.dart';
import 'package:myflutter/features/home/domain/repositories/home_repository.dart';
import 'package:myflutter/features/home/domain/entities/home_entity.dart';

class HomeRepository implements IHomeRepository {
  final HomeDataSource dataSource;

  HomeRepository({required this.dataSource});

  @override
  Future<List<HomeEntity>> fetchHomeData() async {
    final response = await dataSource.fetchHomeData();
    return response.map((e) => HomeEntity(
      id: e.id ?? '', 
      title: e.title ?? ''
    )).toList();
  }
}