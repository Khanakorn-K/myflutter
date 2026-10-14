import 'package:myflutter/features/home/domain/entities/home_entity.dart';

/// Contract ฝั่ง Domain. Data layer ต้อง implement ตัวนี้.
/// ไม่ใช้ prefix `I` ตาม Dart convention.
abstract class HomeRepository {
  Future<List<HomeEntity>> fetchHomeData();
}
