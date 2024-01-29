import 'dart:async';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/utils/locator.dart';
import 'package:coffee_shop/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {

  static pushNamed(String name,
      {Object? extra,
      Map<String, String> pathParameters = const <String, String>{},
      Map<String, dynamic> queryParameters = const <String, dynamic>{}}) {
    Utils.appRouter.route.pushNamed(
      name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static pushReplacement(String name, {Object? extra}) {
    Utils.appRouter.route.pushReplacement(
      name,
      extra: extra,
    );
  }

  static goNamed(String name,
      {Object? extra,
      Map<String, String> pathParameters = const <String, String>{},
      Map<String, dynamic> queryParameters = const <String, dynamic>{}}) {
    Utils.appRouter.route.goNamed(
      name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }



  // بعمل  وقت اما يضفط من زارا الي زرار في ال  bottom nav
  static Timer? timer;

  //  بنادي الفانكشن دي بدل ال  push
  //  بس ل صفح ال  bottom nav  بس
  // باقي الصفح ب الراوت العادي
  static mobileNavigateTo(String routeName) {
    // check for slide left or right
    final slide = slideLeftOrRight(routeName);

    if (timer?.isActive == true) return;
    // بيعمل  go name  لصفحه من صفح ال  bottom nav  بعد ما يحدد نوع النقل يمين
    goNamed(routeName, extra: {"transition": slide} );
    // مش هيقدر ينقل لصفحه تانيه الا بعد 800
    timer = Timer(const Duration(milliseconds: 800), () {
      //  اقفل التايمر
      timer?.cancel();
    });
  }

  // اسماء كل الراوتر الي في الbottom nav  بالترتيب
  
  static mobileRoutes() {
    return [
      AppRouter.home,
      AppRouter.pay,
      AppRouter.order,
      AppRouter.account,
      AppRouter.rewards,
    ];
  }

  // هبعتله اسم الراوتر الي عايزه  وهيرجع ليا الانميشن يساؤ ولا يمين
  static String slideLeftOrRight(String newRoute) {
    // عشان اقدر اطلع اسم الراوتر الحالي
    final currentRoute =
        Utils.appRouter.route.routeInformationProvider.value.location ??
            ""; //====>  ///path/to/the/app
    ///path/
    final currentRouteIndex = mobileRoutes().indexOf(
        Utils.appRouter.route.namedLocation(currentRoute) ??
            ""); //===>   ///path
    // اسم الراوتر الي عايزه
    final newRouteIndex = mobileRoutes().indexOf(newRoute);
    // بقارن عشان اقدر احدد الصفحه الي هتتفتح يمين ولا شمال
    if (currentRouteIndex < newRouteIndex) {
      return "slideRight";
    } else {
      return "slideLeft";
    }
  }
}
