import 'package:flutter/material.dart' hide Router;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'providers/get_it.dart';
import 'router.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app_theme.dart';
import 'constants/values/values.dart';
import 'utils/size_info.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => OverlaySupport(
        child: LayoutBuilder(
          builder: (layoutCtx, constraints) {
            return OrientationBuilder(
              builder: (orientationCtx, orientation) {
                SizeInfo().init(constraints, orientation);
                return ScreenUtilInit(
                  designSize: const Size(1440, 900),
                  builder: (context, child) => MaterialApp.router(
                    title: Strings.appTitle,
                    debugShowCheckedModeBanner: false,
                    theme: buildLightTheme(),
                    darkTheme: buildDarkTheme(),
                    themeMode: ThemeMode.dark,
                    routerDelegate: GetIt.I<AppRouter>().delegate(
                      navigatorObservers: () => [
                        //use this of any purposes (analytics or getting callbacks on stack change or anything else)
                      ],
                    ),
                    routeInformationParser:
                        GetIt.I<AppRouter>().defaultRouteParser(),
                  ),
                );
              },
            );
          },
        ),
      );
}
