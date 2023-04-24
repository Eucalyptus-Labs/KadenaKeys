import 'package:flutter/material.dart' hide Router;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:kadena_keys/providers/get_it.dart';
import 'package:kadena_keys/router.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app_theme.dart';
import 'constants/values/values.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: ScreenUtilInit(
          designSize: const Size(1440, 900),
          builder: (context, child) {
            return MaterialApp.router(
              theme: buildLightTheme(),
              themeMode: ThemeMode.dark,
              darkTheme: buildDarkTheme(),
              routerDelegate: GetIt.I<AppRouter>().delegate(
                navigatorObservers: () => [
                  //use this of any purposes (analytics or getting callbacks on stack change or anything else)
                ],
              ),
              routeInformationParser: GetIt.I<AppRouter>().defaultRouteParser(),
              debugShowCheckedModeBanner: false,
              title: Strings.appTitle,
            );
          }),
    );
  }
}
