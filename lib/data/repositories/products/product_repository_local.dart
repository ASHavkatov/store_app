import 'package:hive/hive.dart';
import 'package:store_app/data/models/categories/category_model.dart';
import 'package:store_app/data/repositories/products/product_repository_interface.dart';

import '../../models/product_model/product_model.dart';

class ProductRepositoryLocal implements IProductRepository {
  final Box<ProductModel> box = Hive.box<ProductModel>("products");
  final Box<CategoryModel> boxCategories = Hive.box<CategoryModel>("categories");

  @override
  Future<List<ProductModel>> fetchProduct({
    String? title,
    int? categoryId,
    int? sizeId,
    double? minPrice,
    double? maxPrice,
    String? orderBy,
  }) async {
    // final values = box.values.toList();
    return box.values.toList();
  }
@override
  Future<List<CategoryModel>> fetchCategories()async{
    return boxCategories.values.toList();
  }

  @override
  Future<bool> fetchIsLike(int id) async {
    final product = box.get(id);
    if (product != null) {
      return product.isLiked ?? false;
    } else {
      return false;
    }
  }
  @override
  Future<bool>fetchUnLike(int id)async{
    final product = box.get(id);
    if(product != null){
      return product.isLiked ?? true;
    }else{
      return false;
    }
  }

}
