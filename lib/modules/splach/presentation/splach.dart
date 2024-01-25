import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/core/utils/utils.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1500), () {
       NavigationService.pushReplacement(AppRouter.onBoarding);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: AppColors.onBackground,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "splach".png(),
                ),
                fit: BoxFit.cover)),
        child: Center(
            child: SvgIcon(
          svg: "logo".svg(),
          width: MediaQuery.of(context).size.width/2,
        )),
      ),
    );
  }
}
