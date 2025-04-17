import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/category_model.dart';
import 'package:store_app/data/models/product_model.dart';

class ProductRepository {
  ProductRepository({required this.client});

  final ApiClient client;

  List<ProductModel>? products;

  List<ProductModel>? savedProducts;

  List<CategoryModel>? categories;

  Future<List<ProductModel>> fetchProduct(
    String? title,
    int? categoryId,
      int? sizeId,
      double? minPrice,
      double? maxPrice,
      String? orderBy
  ) async {
    var rawProduct = await client.fetchProduct(
      queryParams: {"Title": title, "CategoryId": categoryId,"SizeId":sizeId,"MinPrice":minPrice,"MaxPrice": maxPrice,"OrderBy":orderBy},
    );
    products =
        rawProduct.map((products) => ProductModel.fromJson(products)).toList();
    print("raw products initialized success");
    return products!;
  }

  Future<List<CategoryModel>> fetchCategories() async {
    var rawCategories = await client.fetchCategories();
    categories =
        rawCategories
            .map((categories) => CategoryModel.fromJson(categories))
            .toList();
    return categories!;
  }
  Future<List<ProductModel>> fetchSavedProducts()async{
    var rawSavedProduct = await client.fetchSavedProducts();
    savedProducts = rawSavedProduct.map((products)=>ProductModel.fromJson(products)).toList();
    return savedProducts!;
  }
}