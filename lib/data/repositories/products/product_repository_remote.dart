import 'package:hive/hive.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/categories/category_model.dart';
import 'package:store_app/data/models/detail_model/detail_model.dart';
import 'package:store_app/data/models/product_model/product_model.dart';
import 'package:store_app/data/models/size_model/sizes_model.dart';
import 'package:store_app/data/repositories/products/product_repository_interface.dart';

class ProductRepositoryRemote implements IProductRepository {
  ProductRepositoryRemote({required this.client});

  final Box<ProductModel> box = Hive.box<ProductModel>("products");
  final Box<CategoryModel> boxCategories = Hive.box<CategoryModel>("categories",);
  final ApiClient client;

  Future<DetailModel> fetchDetail(int id) async {
    final rawDetails = await client.fetchDetail(id);
    return DetailModel.fromJson(rawDetails);
  }

  @override
  Future<List<ProductModel>> fetchProduct({
    String? title,
    int? categoryId,
    int? sizeId,
    double? minPrice,
    double? maxPrice,
    String? orderBy,
  }) async {
    final Box<ProductModel> box = Hive.box<ProductModel>("products");

    final rawProduct = await client.fetchProduct(
      queryParams: {
        "Title": title,
        "CategoryId": categoryId,
        "SizeId": sizeId,
        "MinPrice": minPrice,
        "MaxPrice": maxPrice,
        "OrderBy": orderBy,
      },
    );
    final products = rawProduct.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
    await box.clear();
    await box.addAll(products);
    // final values = box.values.toList();
    return products;
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final Box<CategoryModel> boxCategories = Hive.box<CategoryModel>("categories");
    final rawCategories = await client.fetchCategories();
    final categories = rawCategories.map((json) => CategoryModel.fromJson(json)).toList();
    await boxCategories.clear();
    await boxCategories.addAll(categories);
    return categories;
  }

  Future<List<ProductModel>> fetchSavedProducts() async {
    final rawSavedProduct = await client.fetchSavedProducts();
    return rawSavedProduct.map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<List<SizesModel>> fetchSizesList() async {
    final rawSizesList = await client.fetchSizesList();
    return rawSizesList.map((json) => SizesModel.fromJson(json)).toList();
  }

  @override
  Future<bool> fetchIsLike(int id) async {
    try {
      final isLiked = await client.fetchIsLike(id);
      return isLiked;
    } catch (e) {
      print('fetchIsLike error: $e');
      return false;
    }
  }
  @override
  Future<bool>fetchUnLike(int id)async{
  try{
    final unLiked = await client.fetchUnLike(id);
    return unLiked;
  }catch(e) {
    print("fetchUnlike hato");
    return false;
  }
  }

}
