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
    final products =
        rawProduct
            .map<ProductModel>((json) => ProductModel.fromJson(json))
            .toList();
    box.clear();
    box.addAll(products);
    box.compact();
    return products;
  }
@override
  Future<List<CategoryModel>> fetchCategories() async {
    final rawCategories = await client.fetchCategories();
    return rawCategories.map((json) => CategoryModel.fromJson(json)).toList();
  }

  Future<List<ProductModel>> fetchSavedProducts() async {
    final rawSavedProduct = await client.fetchSavedProducts();
    return rawSavedProduct.map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<List<SizesModel>> fetchSizesList() async {
    final rawSizesList = await client.fetchSizesList();
    return rawSizesList.map((json) => SizesModel.fromJson(json)).toList();
  }
}