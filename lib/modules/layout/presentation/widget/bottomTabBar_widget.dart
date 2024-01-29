import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
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
                          NavigationService.mobileNavigateTo(AppRouter.home,);
                           cubit.changeClickTab(0);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.home,
                              color: cubit.clickTab == 0
                                  ? AppColors.primary
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: cubit.clickTab == 0
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          NavigationService.mobileNavigateTo(AppRouter.pay);
                           cubit.changeClickTab(1);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.qr_code_scanner,
                              color: cubit.clickTab== 1
                                  ? AppColors.primary
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              "Scan/Pay",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: cubit.clickTab == 1
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          NavigationService.mobileNavigateTo(AppRouter.order,);
                           cubit.changeClickTab(2);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.coffee,
                              color: cubit.clickTab == 2
                                  ? AppColors.primary
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              "Order",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: cubit.clickTab == 2
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                           NavigationService.mobileNavigateTo(AppRouter.account);
                           cubit.changeClickTab(3);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: cubit.clickTab == 3
                                  ? AppColors.primary
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              "Account",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: cubit.clickTab == 3
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                           NavigationService.mobileNavigateTo(AppRouter.rewards);
                          cubit.changeClickTab(4);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.star_border,
                              color: cubit.clickTab== 4
                                  ? AppColors.primary
                                  : Colors.grey,
                              size: 25.0,
                            ),
                            Text(
                              "Rewards",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: cubit.clickTab == 4
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
