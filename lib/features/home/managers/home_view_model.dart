import 'package:flutter/material.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/repositories/product_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required ProductRepository productRepo})
    : _productRepo = productRepo {
    load();
  }

  final ProductRepository _productRepo;

  List<ProductModel>? products;

  Future<void> load() async {
    products = await _productRepo.fetchProduct();
    print("productsga saqlandi");
    notifyListeners();
  }
}
