// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:kadena_keys/pages/home/home_page.dart';
import 'package:kadena_keys/pages/key_derivation_page.dart';

// Project imports:

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
    ),
    // AutoRoute(
    //   page: KeyDerivationRoute.page,
    //   path: '/',
    // ),
  ];
}
