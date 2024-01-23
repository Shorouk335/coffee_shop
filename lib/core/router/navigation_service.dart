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

  static pushReplacement(BuildContext context, String name, {Object? extra}) {
    Utils.appRouter.route.pushReplacement(
          name,
          extra: extra,
        );
  }

  static goNamed(BuildContext context, String name,
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
}
