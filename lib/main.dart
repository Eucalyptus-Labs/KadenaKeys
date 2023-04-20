import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        return MaterialApp(
          title: StringConstants.appTitle,
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.darkCustomTheme,
          home: const HomePage(
            pageTitle: StringConstants.homeTitle,
          ),
          // home: KeyDerivationPage(),
        );
      },
    );
  }
}
