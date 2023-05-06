// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.r.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $launchRoute,
      $homeRoute,
      $chatRoute,
      $settingRoute,
    ];

RouteBase get $launchRoute => GoRouteData.$route(
      path: '/',
      factory: $LaunchRouteExtension._fromState,
    );

extension $LaunchRouteExtension on LaunchRoute {
  static LaunchRoute _fromState(GoRouterState state) => LaunchRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $chatRoute => GoRouteData.$route(
      path: '/chat',
      factory: $ChatRouteExtension._fromState,
    );

extension $ChatRouteExtension on ChatRoute {
  static ChatRoute _fromState(GoRouterState state) => ChatRoute(
        message: state.queryParameters['message'] ?? '',
        hint: state.queryParameters['hint'] ?? '',
      );

  String get location => GoRouteData.$location(
        '/chat',
        queryParams: {
          if (message != '') 'message': message,
          if (hint != '') 'hint': hint,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $settingRoute => GoRouteData.$route(
      path: '/setting',
      factory: $SettingRouteExtension._fromState,
    );

extension $SettingRouteExtension on SettingRoute {
  static SettingRoute _fromState(GoRouterState state) => const SettingRoute();

  String get location => GoRouteData.$location(
        '/setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
