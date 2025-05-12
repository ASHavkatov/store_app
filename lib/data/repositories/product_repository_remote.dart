import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/categories/category_model.dart';
import 'package:store_app/data/models/detail_model/detail_model.dart';
import 'package:store_app/data/models/product_model/product_model.dart';
import 'package:store_app/data/models/size_model/sizes_model.dart';
import 'package:store_app/data/repositories/product_repository_interface.dart';

class ProductRepositoryRemote implements IProductRepository {
  ProductRepositoryRemote({required this.client});
  final Box<ProductModel> box = Hive.box<ProductModel>("products");

  final ApiClient client;

  List<ProductModel>? products;

  List<ProductModel>? savedProducts;

  List<CategoryModel>? categories;

  List<SizesModel>? sizesList;
  DetailModel? detail;

  Future<DetailModel>fetchDetail(int id)async{
    final rawDetails = await client.fetchDetail( id);
    print("asilbek $rawDetails");
    detail = DetailModel.fromJson(rawDetails);
    return detail!;
  }
@override
  Future<List<ProductModel>> fetchProducts (
    String? title,
    int? categoryId,
    int? sizeId,
    double? minPrice,
    double? maxPrice,
    String? orderBy,
  ) async {
    var rawProduct = await client.fetchProduct(
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
        rawProduct.map((products) => ProductModel.fromJson(products)).toList();
    box.clear();
    box.addAll(products);
    box.compact();
    return products;
  }

  Future<List<CategoryModel>> fetchCategories() async {
    var rawCategories = await client.fetchCategories();
    categories =
        rawCategories
            .map((categories) => CategoryModel.fromJson(categories))
            .toList();
    return categories!;
  }

  Future<List<ProductModel>> fetchSavedProducts() async {
    var rawSavedProduct = await client.fetchSavedProducts();
    savedProducts =
        rawSavedProduct
            .map((products) => ProductModel.fromJson(products))
            .toList();
    return savedProducts!;
  }

  Future<List<SizesModel>> fetchSizesList() async {
    var rawSizesList = await client.fetchSizesList();
    sizesList =
        rawSizesList
            .map((sizesList) => SizesModel.fromJson(sizesList))
            .toList();
    return sizesList!;
  }
}
