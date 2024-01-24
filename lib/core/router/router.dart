import 'package:coffee_shop/core/constant/model/favDrinkModel.dart';
import 'package:coffee_shop/modules/DrinkDetails/presentation/drinkDetails.dart';
import 'package:coffee_shop/modules/home/presentation/home.dart';
import 'package:coffee_shop/modules/layout/presentation/layout.dart';
import 'package:coffee_shop/modules/onBoarding/presentation/onboarding.dart';
import 'package:coffee_shop/modules/order/presentation/order.dart';
import 'package:coffee_shop/modules/splach/presentation/splach.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {

  static GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> mobileKey = GlobalKey<NavigatorState>();
  static const String splach = "/";
  static const String onBoarding = "/onBoarding";
  static const String home = "/home";
  static const String order = "/order";
  static const String drinkDetails = "/drink_details";

  GoRouter route =
      GoRouter(navigatorKey: rootKey, initialLocation: home, routes: [
    GoRoute(
        path: "/",
        name: splach,
        builder: (context, state) => const SplachScreen()),
    GoRoute(
        path: "/onBoarding",
        name: onBoarding,
        builder: (context, state) => const OnBoardingScreen()),
    ShellRoute(
         navigatorKey: mobileKey,
      builder: (context, state, child) => LayoutScreen(
        child: child,
      ),
      routes: [
        GoRoute(
          parentNavigatorKey: mobileKey,
          path: "/home",
          name: home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
            parentNavigatorKey: mobileKey,
            path: "/order",
            name: order,
            builder: (context, state) => const OrderScreen()),
        GoRoute(
            parentNavigatorKey: mobileKey,
            path: "/drink_details",
            name: drinkDetails,
            builder: (context, state) => DrinkDetailsScreen(
                  favDrinkModel: state.extra as FavDrinkModel,
                )),
      ],
    ),
  ]);
}
