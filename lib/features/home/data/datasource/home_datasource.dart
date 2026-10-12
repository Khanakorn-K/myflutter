
import 'package:myflutter/features/home/data/models/home_response_model.dart';


class HomeDataSource {
  Future<List<HomeResponseModel>> fetchHomeData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return [
        const HomeResponseModel(id: '1', title: 'Item 1'),
        const HomeResponseModel(id: '2', title: 'Item 2'),
      ];
    } catch (e) {
      throw Exception('Failed to fetch home data');
    }
  }
}