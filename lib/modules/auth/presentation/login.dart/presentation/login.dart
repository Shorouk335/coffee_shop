import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/defultButton.dart';
import 'package:coffee_shop/modules/auth/presentation/login.dart/presentation/widget/bottomSheet.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:coffee_shop/shared/widget/textFormField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.onBackground,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        NavigationService.pop();
                      },
                      child: Text(
                        "Skip",
                        style:
                            TextStyle(color: AppColors.primary, fontSize: 23.0),
                      ),
                    ),
                  ],
                ),
              ),
              SvgIcon(
                svg: "logo".svg(),
                width: 60,
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0)),
                      color: AppColors.background,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 1,
                            color: Colors.grey.withOpacity(0.2))
                      ]),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Row(children: [
                        Text(
                          "Sign In ",
                          style: TextStyle(
                              fontSize: 28.0,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: ((context) {
                                  return BottomSheetWidget();
                                }));
                          },
                          child: Icon(
                            Icons.sensor_occupied,
                            size: 35.0,
                            color: AppColors.primary,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "It’s coffee time! Login and lets get all the coffee in the world! Or at least iced coffee. ",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      DefultTextFormField(
                        fillColor: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Colors.grey.withOpacity(0.2))
                        ],
                        cursorColor: AppColors.secondary,
                        title: "User Name",
                        titleColor: AppColors.secondary,
                        titleSize: 25.0,
                        borderRadius: 15.0,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 20.0),
                        hintText: "user name",
                        textSize: 18.0,
                        textColor: AppColors.primary,
                        textStyle: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DefultTextFormField(
                        obscureText: true,
                        isPassword: true,
                        fillColor: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Colors.grey.withOpacity(0.2))
                        ],
                        cursorColor: AppColors.secondary,
                        title: "Email or phone number",
                        titleColor: AppColors.secondary,
                        titleSize: 25.0,
                        borderRadius: 15.0,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 20.0),
                        hintText: "Type your password",
                        textSize: 18.0,
                        textColor: AppColors.primary,
                        textStyle: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DefultButton(
                        onTap: () {},
                        title: "LOGIN",
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Reset here",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DefultButton(
                        onTap: () {},
                        title: "CREATE NEW ACCOUNT",
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
