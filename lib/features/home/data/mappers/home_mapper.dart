import 'package:myflutter/features/home/data/models/home_response_model.dart';
import 'package:myflutter/features/home/domain/entities/home_entity.dart';

/// Mapper อยู่ฝั่ง data เท่านั้น แปลง Model -> Entity.
/// เป็น pure sync ห้ามเป็น Future (ไม่มี async งาน) และห้าม Domain รู้จักไฟล์นี้.
extension HomeResponseModelMapper on HomeResponseModel {
  HomeEntity toEntity() => HomeEntity(id: id, title: title);
}

extension HomeResponseModelListMapper on List<HomeResponseModel> {
  List<HomeEntity> toEntities() => map((e) => e.toEntity()).toList();
}
