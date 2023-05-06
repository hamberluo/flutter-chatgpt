import 'package:cogni_chat/src/biz_ui/presentation/chat/page.dart';
import 'package:cogni_chat/src/biz_ui/presentation/home/page.dart';
import 'package:cogni_chat/src/biz_ui/presentation/launch/page.dart';
import 'package:cogni_chat/src/biz_ui/presentation/setting/page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'route.r.g.dart';

final GoRouter router = GoRouter(
  routes: [...$appRoutes],
  observers: [],
  navigatorKey: _navigatorKey,
);

final _navigatorKey = GlobalKey<NavigatorState>();

class RoutePath {
  static const root = '/';
  static const home = '/home';
  static const chat = '/chat';
  static const setting = '/setting';
}

@TypedGoRoute<LaunchRoute>(path: RoutePath.root)
class LaunchRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const LaunchPage();
}

@TypedGoRoute<HomeRoute>(path: RoutePath.home)
class HomeRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}

@TypedGoRoute<ChatRoute>(path: RoutePath.chat)
class ChatRoute extends GoRouteData {
  const ChatRoute({
    this.message = '',
    this.hint = '',
  });

  final String message;
  final String hint;

  @override
  Widget build(BuildContext context, GoRouterState state) => ChatPage(
        message: message,
        hint: hint,
      );
}

@TypedGoRoute<SettingRoute>(path: RoutePath.setting)
class SettingRoute extends GoRouteData {
  const SettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SettingPage();
}
