import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/modules/home/presentation/home.dart';
import 'package:coffee_shop/modules/layout/cubit/cubit.dart';
import 'package:coffee_shop/modules/layout/presentation/widget/bottomTabBar_widget.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key, this.initialPage = 0});
  final int initialPage;

  @override
  State<LayoutScreen> createState() => LayoutScreenState();
}

class LayoutScreenState extends State<LayoutScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    final cubit = LayoutCubit.get(context);
    cubit.tabController = TabController(
        length: 5, vsync: this, initialIndex: widget.initialPage ?? 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: Icon(
          Icons.menu,
          size: 35,
        ),
        title: SvgIcon(svg: "logo".svg(), width: 30),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.card_travel_rounded,
                size: 35.0,
              ))
        ],
      ),
      body: TabBarView(
        controller: cubit.tabController,
        children: [
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: BottomTabBar(),
    );
  }
}
