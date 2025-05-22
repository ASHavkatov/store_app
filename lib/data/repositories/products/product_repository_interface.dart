import 'package:store_app/data/models/categories/category_model.dart';

import '../../models/product_model/product_model.dart';

abstract interface class IProductRepository {

  Future<List<ProductModel>> fetchProduct({
    String? title,
    int? categoryId,
    int? sizeId,
    double? minPrice,
    double? maxPrice,
    String? orderBy,
  });

  Future<List<CategoryModel>> fetchCategories();
  Future<bool> fetchIsLike(int id);
  Future<bool>fetchUnLike(int id);
}
