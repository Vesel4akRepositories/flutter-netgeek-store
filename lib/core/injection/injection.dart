import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:netgeek/core/injection/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configureInjection(String env) async {
  $initGetIt(getIt, environment: env);
}
