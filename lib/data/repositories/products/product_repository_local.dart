import 'package:hive/hive.dart';
import 'package:store_app/data/repositories/products/product_repository_interface.dart';

import '../../models/product_model/product_model.dart';

class ProductRepositoryLocal implements IProductRepository {
  final Box<ProductModel> box = Hive.box<ProductModel>("products");

  @override
  Future<List<ProductModel>> fetchProduct({
    String? title,
    int? categoryId,
    int? sizeId,
    double? minPrice,
    double? maxPrice,
    String? orderBy,
  }) async {
    return box.values.toList();
  }
}
