import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/product_model.dart';

class ProductRepository{
  ProductRepository({required this.client});

  final ApiClient client;

  List<ProductModel>? products ;

  Future<List<ProductModel>> fetchProduct()async{
    var rawProduct = await client.fetchProduct();
    products = rawProduct.map((products)=>ProductModel.fromJson(products)).toList();
    print("map boldi");
    return products!;
  }
}