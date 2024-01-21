import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/modules/layout/cubit/cubit.dart';
import 'package:coffee_shop/modules/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = LayoutCubit.get(context);
        return BottomAppBar(
            elevation: 10,
            color: Colors.white,
            height: 80,
            padding: EdgeInsets.zero,
            child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          cubit.changeTabController(0);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.home,
                              color: cubit.tabController?.index == 0
                                  ? AppColors.primary
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: cubit.tabController?.index == 0
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeTabController(1);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.qr_code_scanner,
                              color: cubit.tabController?.index == 1
                                  ? AppColors.primary
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              "Scan/Pay",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: cubit.tabController?.index == 1
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeTabController(2);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.coffee,
                              color: cubit.tabController?.index == 2
                                  ? AppColors.primary
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              "Order",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: cubit.tabController?.index == 2
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeTabController(3);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: cubit.tabController?.index == 3
                                  ? AppColors.primary
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              "Account",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: cubit.tabController?.index == 3
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeTabController(4);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.star_border,
                              color: cubit.tabController?.index == 4
                                  ? AppColors.primary
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              "Rewards",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: cubit.tabController?.index == 4
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ])));
      },
    );
  }
}
