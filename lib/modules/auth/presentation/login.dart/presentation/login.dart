import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/defultButton.dart';
import 'package:coffee_shop/modules/auth/cubit/cubit.dart';
import 'package:coffee_shop/modules/auth/cubit/states.dart';
import 'package:coffee_shop/modules/auth/presentation/login.dart/presentation/widget/bottomSheet.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:coffee_shop/shared/widget/textFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
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
                              style: TextStyle(
                                  color: AppColors.primary, fontSize: 23.0),
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
                        padding:
                            EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0),
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
                              textController: email,
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
                              textController: password,
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
                              onTap: () async {
                                await cubit.login(
                                    emailAddress: email.text,
                                    password: password.text);
                              },
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
                                InkWell(
                                  onTap: () async {
                                    await FirebaseAuth.instance.signOut();
                                  },
                                  child: Text(
                                    "Sign out",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                              onTap: () async {
                                await cubit.createAccount(
                                    emailAddress: email.text,
                                    password: password.text);
                              },
                              title: "CREATE NEW ACCOUNT",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () async {
                                      await cubit
                                          .signInWithGoogle()
                                          .then((value) {
                                        cubit.userCredential = value;
                                      });
                                    },
                                    child: FaIcon(FontAwesomeIcons.google,
                                        size: 45 , 
                                        color: Colors.red,
                                        
                                        
                                        )),
                                        SizedBox(width: 20,),
                                          InkWell(
                                    onTap: ()  {
                                   
                                      } ,
                                    
                                    child: FaIcon(FontAwesomeIcons.facebook,
                                        size: 45 , 
                                        color: Colors.blue,
                                        
                                        
                                        )),
                              ],
                            )
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
