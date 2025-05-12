import 'package:store_app/data/models/product_model/product_model.dart';

abstract interface class IProductRepository {
  Future<List<ProductModel>> fetchProducts(
    String? title,
    int? categoryId,
    int? sizeId,
    double? minPrice,
    double? maxPrice,
    String? orderBy,
  );
}
