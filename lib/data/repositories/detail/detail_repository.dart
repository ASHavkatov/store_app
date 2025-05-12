import 'package:store_app/core/client.dart';

import '../../models/detail_model/detail_model.dart';

class DetailRepository{
  final ApiClient client;
  DetailRepository({required this.client});

  Future<DetailModel> fetchDetail(int id) async {
    final rawDetails = await client.fetchDetail(id);
    final detail = DetailModel.fromJson(rawDetails);
    return detail;
  }
}