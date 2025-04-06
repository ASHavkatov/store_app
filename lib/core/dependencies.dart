import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/features/authentication/login/manager/login_view_model.dart';
import 'package:store_app/features/authentication/login/pages/login_view.dart';
import 'package:store_app/features/authentication/sign_up/manager/sign_up_view_model.dart';

import '../data/repositories/auth_repository.dart';
import 'client.dart';
import 'l10n/localization_view_model.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(create: (context) => AuthRepository(client: context.read())),
  ChangeNotifierProvider(create: (context) => LocalizationViewModel()),
  ChangeNotifierProvider(create: (context)=> LoginViewModel(repo: context.read())),
  ChangeNotifierProvider(create: (context)=> SignUpViewModel(authRepo: context.read())),
];
