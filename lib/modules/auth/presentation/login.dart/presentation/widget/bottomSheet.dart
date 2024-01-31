import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/defultButton.dart';
import 'package:coffee_shop/modules/home/presentation/home.dart';
import 'package:coffee_shop/modules/layout/presentation/layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.sensor_occupied,
            size: 80.0,
            color: AppColors.primary,
          ),
          Text(
            "Want to enable faceID?",
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "This helps you login quicker!",
            style: TextStyle(color: AppColors.primary, fontSize: 18.0),
          ),
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefultButton(
                  onTap: () {
                    NavigationService.goNamed(AppRouter.home);
                  },
                  title: "Yes",
                  width: 150,
                ),
                DefultButton(
                  onTap: () {
                    NavigationService.pop();
                  },
                  title: "No",
                  width: 150,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
