
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:flutter/material.dart';

class defultButton extends StatelessWidget {
  const defultButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width , 
    this.color 

  });

  final void Function()? onTap;
  final String title;
  final double? width ;
  final Color? color ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.0,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: color ?? AppColors.primary,
            boxShadow: [
              BoxShadow(blurRadius: 1.0, spreadRadius: 0.5 , 
               color: color ??  AppColors.primary
              ),
            ]),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}

