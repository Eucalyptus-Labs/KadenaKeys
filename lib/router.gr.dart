// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    KeyDerivationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const KeyDerivationPage(),
      );
    }
  };
}

/// generated route for
/// [KeyDerivationPage]
class KeyDerivationRoute extends PageRouteInfo<void> {
  const KeyDerivationRoute({List<PageRouteInfo>? children})
      : super(
          KeyDerivationRoute.name,
          initialChildren: children,
        );

  static const String name = 'KeyDerivationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
