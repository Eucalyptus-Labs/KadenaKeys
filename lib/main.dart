import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kadena_keys/pages/home/home_binding.dart';
import 'package:kadena_keys/pages/key_derivation_page.dart';
import 'package:kadena_keys/utils/app_pages.dart';
import 'package:kadena_keys/utils/string_constants.dart';
import 'package:kadena_keys/utils/themes/app_theme_data.dart';
import 'package:kadena_keys/pages/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print('got here');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      builder: (context, child) {
        return GetMaterialApp(
          title: StringConstants.appTitle,
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.darkCustomTheme,
          // home: const HomePage(),
          home: const KeyDerivationPage(),
          initialBinding: HomeBinding(),
          getPages: AppPages.pages,
        );
      },
    );
  }
}
