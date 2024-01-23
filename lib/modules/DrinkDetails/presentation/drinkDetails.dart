import 'package:coffee_shop/core/constant/model/favDrinkModel.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:flutter/material.dart';

class DrinkDetailsScreen extends StatefulWidget {
  const DrinkDetailsScreen({super.key, required this.favDrinkModel});
  final FavDrinkModel favDrinkModel;

  @override
  State<DrinkDetailsScreen> createState() => _DrinkDetailsScreenState();
}

class _DrinkDetailsScreenState extends State<DrinkDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
            Container(
              height: 200,
              color: AppColors.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgIcon(
                    svg: widget.favDrinkModel.img.svg(),
                    width: 60,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    widget.favDrinkModel.name,
                    style: TextStyle(color: Colors.white, fontSize: 22.0 , overflow: TextOverflow.ellipsis ),
                  )
                ],
              ),
            )
            // Text
          
          ]),
        ),
      ),
    );
  }
}
