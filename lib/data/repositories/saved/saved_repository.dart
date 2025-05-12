import 'package:store_app/core/client.dart';

import '../../models/product_model/product_model.dart';

class SavedRepository{
  final ApiClient client;
  SavedRepository({required this.client});

  Future<List<ProductModel>> fetchSavedProducts() async {
    var rawSavedProduct = await client.fetchSavedProducts();
   final  savedProducts =
        rawSavedProduct
            .map((products) => ProductModel.fromJson(products))
            .toList();
    return savedProducts;
  }

}