import 'package:get/get.dart';
import '../pages/home/home_binding.dart';
import '../pages/home/home_page.dart';
import '../pages/key_derivation_page.dart';
import 'app_routes.dart';

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
