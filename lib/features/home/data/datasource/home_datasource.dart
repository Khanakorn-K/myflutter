import 'package:myflutter/core/error/failures.dart';
import 'package:myflutter/features/home/data/models/home_response_model.dart';

/// Abstract DataSource — Dart convention ไม่ใช้ prefix `I`.
abstract class HomeDataSource {
  Future<List<HomeResponseModel>> fetchHomeData();
}

/// ดึงจาก Remote (API). ตอนนี้ยังเป็น mock ไว้ก่อน
/// ถ้าจะทำ Local/Mock ให้สร้าง class ใหม่ implement [HomeDataSource].
class HomeRemoteDataSource implements HomeDataSource {
  @override
  Future<List<HomeResponseModel>> fetchHomeData() async {
    try {
      // TODO: Replace with actual API call (http/dio).
      await Future.delayed(const Duration(seconds: 2));
      return const [
        HomeResponseModel(id: '1', title: 'Item 1'),
        HomeResponseModel(id: '2', title: 'Item 2'),
      ];
    } catch (e) {
      throw ServerException('Failed to fetch home data: $e');
    }
  }
}
