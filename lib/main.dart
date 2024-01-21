import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:coffee_shop/core/utils/locator.dart';
import 'package:coffee_shop/core/utils/utils.dart';
import 'package:coffee_shop/modules/layout/cubit/cubit.dart';
import 'package:coffee_shop/shared/widget/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LayoutCubit())],
      child: MaterialApp.router(
        // route
        routeInformationParser: Utils.appRouter.route.routeInformationParser,
        routeInformationProvider:
            Utils.appRouter.route.routeInformationProvider,
        routerDelegate: Utils.appRouter.route.routerDelegate,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemesManger.appTheme,

        builder: (context, child) {
          return ResponsineWrapper(child: child!);
        },
      ),
    );
  }
}
