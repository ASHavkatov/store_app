import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/categories/category_model.dart';
import 'package:store_app/data/models/my_cart_model/my_cart_model.dart';
import 'package:store_app/data/models/product_model/product_model.dart';

class ProductRepository {
  ProductRepository({required this.client});

  final ApiClient client;

  List<ProductModel>? products;


  List<CategoryModel>? categories;




  Future<MyCartModel> fetchMyCart() async {
    final rawCart = await client.fetchMyCard();
    var cart = MyCartModel.fromJson(rawCart);
    return cart;
  }

  Future<List<ProductModel>> fetchProduct({ String? title,
    int? categoryId,
    int? sizeId,
    double? minPrice,
    double? maxPrice,
    String? orderBy}) async {
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
    products =
        rawProduct.map((products) => ProductModel.fromJson(products)).toList();
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

}
