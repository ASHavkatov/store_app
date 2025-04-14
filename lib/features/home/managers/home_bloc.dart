// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:store_app/data/models/product_model.dart';
// import '../../../data/repositories/product_repository.dart';
// import 'home_event.dart';
// import 'home_state.dart';
//
// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   final ProductRepository productRepository;
//
//   ProductBloc({required this.productRepository}) : super(ProductInitial());
//
//   @override
//   Future<ProductState> mapEventToState(ProductEvent event) async {
//     if (event is FetchProductsEvent) {
//       try {
//         // Fetch products from repository
//         final List<ProductModel> products = await productRepository.fetchProduct(event.title, event.id);
//         return ProductLoaded(products: products); // Return loaded state with products
//       } catch (e) {
//         return ProductError(errorMessage: e.toString()); // Return error state
//       }
//     }
//     return ProductInitial(); // Default state if event doesn't match
//   }
//
// }
