// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import '../router.dart';

void registerGetIt() {
  GetIt.I.registerSingleton<AppRouter>(AppRouter());
}
