import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/categories/category_model.dart';
import 'package:store_app/data/models/my_cart_model/my_cart_model.dart';
import 'package:store_app/data/models/product_model/product_model.dart';
import 'package:store_app/data/repositories/products/product_repository_interface.dart';
import 'package:store_app/data/repositories/products/product_repository_local.dart';
import 'package:store_app/data/repositories/products/product_repository_remote.dart';

class ProductRepository implements IProductRepository {
  ProductRepository({required this.remoteRepo, required this.localRepo, required this.client});

  final ProductRepositoryRemote remoteRepo;
  final ProductRepositoryLocal localRepo;
  final ApiClient client;



  @override
  Future<List<ProductModel>> fetchProduct({
    String? title,
    int? categoryId,
    int? sizeId,
    double? minPrice,
    double? maxPrice,
    String? orderBy,
  }) async {
    final isConnect = await Connectivity().checkConnectivity();
    final isOnline = isConnect.contains(ConnectivityResult.mobile) || isConnect.contains(ConnectivityResult.wifi);
    if (isOnline) {
      return await remoteRepo.fetchProduct(
        title: title,
        categoryId: categoryId,
        sizeId: sizeId,
        minPrice: minPrice,
        maxPrice: maxPrice,
        orderBy: orderBy,
      );
    } else {
      return await localRepo.fetchProduct(
        title: title,
        categoryId: categoryId,
        sizeId: sizeId,
        minPrice: minPrice,
        maxPrice: maxPrice,
        orderBy: orderBy,
      );
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final isConnect = await Connectivity().checkConnectivity();
    final isOnline = isConnect.contains(ConnectivityResult.mobile) || isConnect.contains(ConnectivityResult.wifi);
    if (isOnline) {
      return await remoteRepo.fetchCategories();
    } else {
      return await localRepo.fetchCategories();
    }
  }

  Future<bool> fetchIsLike(int id) async {
    try {
      final isLiked = await client.fetchIsLike(id);
      return isLiked;
    } catch (e) {
      print('LikeRepository.fetchIsLike error: $e');
      return false;
    }
  }
  Future<bool>fetchUnLike(int id)async{
    try{
      final unLiked = await client.fetchUnLike(id);
      return unLiked;
    }catch(e){
      print("Unlike qilishda hatolik $e");
      return false;
    }
  }
}
