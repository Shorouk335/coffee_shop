import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/modules/home/presentation/home.dart';
import 'package:coffee_shop/modules/layout/cubit/cubit.dart';
import 'package:coffee_shop/modules/layout/presentation/widget/bottomTabBar_widget.dart';
import 'package:coffee_shop/modules/order/presentation/order.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key, this.child});
  final Widget? child;

  @override
  State<LayoutScreen> createState() => LayoutScreenState();
}

class LayoutScreenState extends State<LayoutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60.0,
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: InkWell(
          onTap: (){
            NavigationService.pushNamed(AppRouter.login);
          },

          child: Icon(
            Icons.menu,
            size: 35,
          ),
        ),
        title: SvgIcon(svg: "logo".svg(), width: 30),
        actions: [
          IconButton(
              onPressed: () {
                NavigationService.pushNamed(
                  AppRouter.cart,
                );
              },
              icon: Icon(
                Icons.card_travel_rounded,
                size: 35.0,
              )),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: widget.child,
      bottomNavigationBar: BottomTabBar(),
    );
  }
}
