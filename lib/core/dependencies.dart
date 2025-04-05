import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repositories/auth_repository.dart';
import 'client.dart';
import 'l10n/localization_view_model.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(create: (context) => AuthRepository(client: context.read())),
  ChangeNotifierProvider(create: (context) => LocalizationViewModel()),
];
