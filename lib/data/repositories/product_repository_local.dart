import 'package:store_app/data/models/product_model/product_model.dart';
import 'package:hive/hive.dart';
import 'package:store_app/data/repositories/product_repository_interface.dart';

class ProductRepositoryLocal implements IProductRepository{
  final Box<ProductModel> box = Hive.box<ProductModel>("products");
  @override
  Future<List<ProductModel>> fetchProducts(
       String? title,
      int? categoryId,
      int? sizeId,
      double? minPrice,
      double? maxPrice,
      String? orderBy,) async{
    final products = box.values.toList();
    return products;
  }
}