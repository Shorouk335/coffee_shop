import 'package:coffee_shop/core/constant/model/favDrinkModel.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/cart.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/invoice.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/tracker.dart';
import 'package:coffee_shop/modules/DrinkDetails/presentation/drinkDetails.dart';
import 'package:coffee_shop/modules/auth/presentation/login.dart/login.dart';
import 'package:coffee_shop/modules/home/presentation/home.dart';
import 'package:coffee_shop/modules/layout/presentation/layout.dart';
import 'package:coffee_shop/modules/onBoarding/presentation/onboarding.dart';
import 'package:coffee_shop/modules/order/presentation/order.dart';
import 'package:coffee_shop/modules/splach/presentation/splach.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> mobileKey = GlobalKey<NavigatorState>();
  static const String splach = "/";
  static const String onBoarding = "/onBoarding";
  static const String home = "/home";
  static const String order = "/order";
  static const String pay = "/pay";
  static const String account = "/account";
  static const String rewards = "/rewards";
  static const String drinkDetails = "/drink_details";
  static const String cart = "/cart";
  static const String invoice = "/invoice";
  static const String tracker = "/tracker";
  static const String login = "/login";

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
         GoRoute(
        path: "/login",
        name: login,
        builder: (context, state) => const LoginScreen()),
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
          pageBuilder: (context, state) => pageBuilder(
            context,
            state,
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: mobileKey,
          path: "/pay",
          name: pay,
          pageBuilder: (context, state) => pageBuilder(context, state,
              child: Scaffold(
                backgroundColor: Colors.amber,
                body: Center(
                  child: Text("Pay"),
                ),
              )),
        ),
        GoRoute(
          parentNavigatorKey: mobileKey,
          path: "/order",
          name: order,
          pageBuilder: (context, state) =>
              pageBuilder(context, state, child: OrderScreen()),
        ),
        GoRoute(
          parentNavigatorKey: mobileKey,
          path: "/account",
          name: account,
          pageBuilder: (context, state) => pageBuilder(
            context,
            state,
            child: Scaffold(
              backgroundColor: Colors.red,
              body: Center(
                child: Text("account"),
              ),
            ),
          ),
        ),
        GoRoute(
          parentNavigatorKey: mobileKey,
          path: "/rewards",
          name: rewards,
          pageBuilder: (context, state) => pageBuilder(
            context,
            state,
            child: Scaffold(
              backgroundColor: Colors.amber,
              body: Center(
                child: Text("Rewards"),
              ),
            ),
          ),
        ),
        GoRoute(
            parentNavigatorKey: mobileKey,
            path: "/drink_details",
            name: drinkDetails,
            pageBuilder: (context, state) => pageBuilder(
                  context,
                  state,
                  isMobileRoute: false,
                  child: DrinkDetailsScreen(
                    favDrinkModel: state.extra as FavDrinkModel,
                  ),
                )),
        GoRoute(
            parentNavigatorKey: mobileKey,
            path: "/cart",
            name: cart,
            pageBuilder: (context, state) => pageBuilder(
                  context,
                  state,
                  isMobileRoute: false,
                  child: CartScreen(),
                )),
        GoRoute(
            parentNavigatorKey: mobileKey,
            path: "/invoice",
            name: invoice,
            pageBuilder: (context, state) => pageBuilder(
                  context,
                  state,
                  isMobileRoute: false,
                  child: InvoiceWidget(),
                )),
                GoRoute(
            parentNavigatorKey: mobileKey,
            path: "/tracker",
            name: tracker,
            pageBuilder: (context, state) => pageBuilder(
                  context,
                  state,
                  isMobileRoute: false,
                  child: TrackerWidget(),
                )),
      ],
    ),
  ]);

  // ممكن افكني من كل الحوار ده بتاع  left  و right
  //  واعمل

  //  static Page pageBuilder(BuildContext context, GoRouterState state,
  //     {required Widget child, bool maintainState = false}) {
  //       return  MaterialPage(
  //         maintainState:maintainState,
  //         key: state.pageKey,
  //         child: child,
  //       );
  //   }

//     maintainState:  false
//  في حاله لو انا في صفحه وعايز ارجع للي قبلها الصفحه الي قبلها مش هتتحفظ في الميموري
//  واما ارجعلها هعملها  loaading   من اول

// في حاله لو عايز اعمل  animation   بين الصفح

  static Page pageBuilder(BuildContext context, GoRouterState state,
      {required Widget child,
      bool maintainState = false,
      bool isMobileRoute = true}) {
    if (isMobileRoute) {
      switch ((state.extra as Map?)?["transition"]) {
        case "slideLeft":
          //  animation  ال  left
          return slideLeftTransition(context, state,
              child: child, maintainState: maintainState);
        case "slideRight":
          //  animation  ال  right
          return slideRightTranslation(context, state,
              child: child, maintainState: maintainState);

        default:
          return MaterialPage(
              maintainState: maintainState, key: state.pageKey, child: Container(
                color: AppColors.background,
                child: child));
      }
    } else {
      return MaterialPage(
          maintainState: maintainState, key: state.pageKey, child: Container(
            color: AppColors.background,
            child: child));
    }
  }

  // slide left nav
  static Page slideLeftTransition(BuildContext context, GoRouterState state,
      {required Widget child, bool maintainState = false}) {
    return CustomTransitionPage(
      maintainState: maintainState,
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  // slide left nav

  static Page slideRightTranslation(BuildContext context, GoRouterState state,
      {required Widget child, bool maintainState = false}) {
    return CustomTransitionPage(
      maintainState: maintainState,
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}
