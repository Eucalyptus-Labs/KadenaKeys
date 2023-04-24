import 'package:get/get.dart';
import 'package:kadena_keys/pages/home/home_binding.dart';
import 'package:kadena_keys/pages/home/home_page.dart';
import 'package:kadena_keys/pages/key_derivation_page.dart';
import 'package:kadena_keys/utils/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    ..._homePages,
  ];

  static final List<GetPage> _homePages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.keyDerivation,
      page: () => const KeyDerivationPage(),
    ),
  ];
}
