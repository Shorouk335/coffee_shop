import 'package:coffee_shop/modules/home/presentation/home.dart';
import 'package:coffee_shop/modules/layout/presentation/layout.dart';
import 'package:coffee_shop/modules/onBoarding/presentation/onboarding.dart';
import 'package:coffee_shop/modules/splach/presentation/splach.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GlobalKey<NavigatorState> rootkey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> layoutkey = GlobalKey<NavigatorState>();

  static const String splach = "/";
  static const String onBoarding = "/onBoarding";
  static const String home1 = "/home1";
  static const String home2 = "/home2";

  GoRouter route =
      GoRouter(navigatorKey: rootkey, initialLocation: splach, routes: [
    GoRoute(
        path: "/", name: splach, builder: (context, state) => SplachScreen()),
    GoRoute(
        path: "/onBoarding",
        name: onBoarding,
        builder: (context, state) => OnBoardingScreen()),
    ShellRoute(
        navigatorKey: layoutkey,
        builder: (context, state, child) => LayoutScreen(
          initialPage: state.extra as int,
        ),
        routes: [
          GoRoute(
              parentNavigatorKey: layoutkey,
              path: "/home1",
              name: home1,
              builder: (context, state) => HomeScreen()),
          GoRoute(
              parentNavigatorKey: layoutkey,
              path: "/home2",
              name: home2,
              builder: (context, state) => HomeScreen()),
        ])
  ]);
}
