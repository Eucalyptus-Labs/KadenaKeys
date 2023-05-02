// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import '../router.dart';
import '../store/home_page/home_page_store.dart';

void registerGetIt() {
  GetIt.I.registerSingleton<AppRouter>(AppRouter());
  GetIt.I.registerSingleton(HomePageStore());
}
