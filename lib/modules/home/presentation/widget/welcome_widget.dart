import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical :15.0),
      child: Row( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning Vasken!",
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5,), 
            Text(
              "Yay for Coffeeeee! ☕️ ",
              style: TextStyle(color: AppColors.primary, fontSize: 25.0),
            )
          ],
        ),
        Spacer(),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: AppColors.primary, width: 2)),
          child: Icon(Icons.account_circle_sharp, size: 40 , color: AppColors.primary),
        )
      ]),
    );
  }
}
