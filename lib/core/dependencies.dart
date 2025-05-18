import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/data/repositories/detail/detail_repository.dart';
import 'package:store_app/data/repositories/notification/notification_repository.dart';
import 'package:store_app/data/repositories/products/product_repository.dart';
import 'package:store_app/data/repositories/saved/saved_repository.dart';
import 'package:store_app/data/repositories/sizes/size_repository.dart';
import 'package:store_app/features/authentication/login/blocs/login_bloc.dart';
import 'package:store_app/features/authentication/sign_up/manager/sign_up_view_model.dart';
import 'package:store_app/features/my_card/blocs/my_cart_bloc.dart';

import '../data/repositories/auth_repositories_models/auth_repository.dart';
import '../data/repositories/products/product_repository_local.dart';
import '../data/repositories/products/product_repository_remote.dart';
import '../data/repositories/review/reviews_repository.dart';
import '../features/authentication/login/manager/login_view_model.dart';
import '../features/home/managers/home_bloc.dart';
import 'client.dart';
import 'l10n/localization_view_model.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),

  // Add these two before ProductRepository
  Provider(create: (context) => ProductRepositoryRemote(client: context.read())),
  Provider(create: (context) => ProductRepositoryLocal()),

  Provider(create: (context) => AuthRepository(client: context.read())),
  Provider(create: (context) => SavedRepository(client: context.read())),
  Provider(create: (context) => DetailRepository(client: context.read())),
  Provider(create: (context) => SizeRepository(client: context.read())),
  Provider(create: (context) => ProductRepositoryLocal()),
  Provider(create: (context) => ProductRepositoryRemote(client: context.read())),
  Provider(
    create: (context) => ProductRepository(
      client: context.read<ApiClient>(),
      remoteRepo: context.read<ProductRepositoryRemote>(),
      localRepo: context.read<ProductRepositoryLocal>(),
    ),
  ),
  Provider(create: (context) => ReviewsRepository(client: context.read())),
  Provider(create: (context) => NotificationRepository(client: context.read())),

  ChangeNotifierProvider(create: (context) => LocalizationViewModel()),
  ChangeNotifierProvider(create: (context) => LoginViewModel(repo: context.read())),
  ChangeNotifierProvider(create: (context) => SignUpViewModel(authRepo: context.read())),

  BlocProvider(create: (context) => LoginBloc(repo: context.read())),
  BlocProvider(create: (context) => HomeBloc(
    productRepo: context.read(),
    sizeRepo: context.read(),
  )),
  BlocProvider(create: (context) => MyCartBloc(repo: context.read())),
];
