import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.background,
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Skip",
                      style:
                          TextStyle(color: AppColors.primary, fontSize: 23.0 ),
                    ),
                  ],
                ),
               
              ),
              SvgIcon(
                  svg: "logo".svg(),
                  width: 60,
                  
                  
                ) , 
              SizedBox(height: 25,),
              Container( 
                padding: EdgeInsets.all(30.0),
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0), 
                  color: Colors.white , 
                  boxShadow: [
                    // BoxShadow(
                    //   blurRadius: 1.5, 
                    //   spreadRadius: 0.1 , 
                    //   offset: Offset(-1, 0)
                    // )
                  ]
                ),
                child: Column(children: [ 
                   Row(
                    children: [
                      Text("Sign In " , style: TextStyle(
                        fontSize: 30.0 ,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold 


                      ),) , 
                      Spacer(), 
                      Icon(
                        Icons.sensor_occupied , 
                        size: 40.0,
                        color: AppColors.primary,

                      )


                   ],)


                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
