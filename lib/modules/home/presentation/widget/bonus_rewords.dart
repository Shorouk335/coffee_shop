import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:flutter/material.dart';

class BounsRewordsWidget extends StatelessWidget {
  const BounsRewordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "BONUS REWARDS",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Coffee Delivered to your house",
                          style: TextStyle(color: Colors.white, fontSize: 18.0))
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order 2 bags of coffee and get bonus stars!",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Order any of our coffee and get an additional 30 Stars! Now that’s how you get free coffee!",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.0))
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Shop Now",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: 20,
            right: 10,
            child: SvgIcon(
              svg: "logo".svg(),
              width: 45,
            )),
      ],
    );
  }
}
