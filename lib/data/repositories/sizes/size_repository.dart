import 'package:store_app/core/client.dart';

import '../../models/size_model/sizes_model.dart';

class SizeRepository {
  final ApiClient client;

  SizeRepository({required this.client});

  Future<List<SizesModel>> fetchSizesList() async {
    var rawSizesList = await client.fetchSizesList();
    final sizesList =
        rawSizesList
            .map((sizesList) => SizesModel.fromJson(sizesList))
            .toList();
    return sizesList;
  }
}
