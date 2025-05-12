import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store_app/data/models/product_model/product_model.dart';
import 'package:store_app/data/repositories/product_repository_interface.dart';
import 'package:store_app/data/repositories/product_repository_local.dart';
import 'package:store_app/data/repositories/product_repository_remote.dart';

class ProductRepository implements IProductRepository {
  final ProductRepositoryLocal localRepo;
  final ProductRepositoryRemote remoteRepo;

  ProductRepository({required this.localRepo, required this.remoteRepo});

  @override
  Future<List<ProductModel>> fetchProducts(
    String? title,
    int? categoryId,
    int? sizeId,
    double? minPrice,
    double? maxPrice,
    String? orderBy,
  ) async {
    final isConnect = await Connectivity().checkConnectivity();
    final isOnline =
        isConnect.contains(ConnectivityResult.mobile) ||
        isConnect.contains(ConnectivityResult.wifi);
    if (isOnline) {
      return await remoteRepo.fetchProducts(
        title,
        categoryId,
        sizeId,
        minPrice,
        maxPrice,
        orderBy,
      );
    } else {
      return await localRepo.fetchProducts(
        title,
        categoryId,
        sizeId,
        minPrice,
        maxPrice,
        orderBy,
      );
    }
  }
}
