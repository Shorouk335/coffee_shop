import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/validation.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/defultButton.dart';
import 'package:coffee_shop/modules/auth/cubit/cubit.dart';
import 'package:coffee_shop/shared/widget/textFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class SureCodeScreen extends StatefulWidget {
  const SureCodeScreen({super.key, required this.phoneText});
  final String phoneText;

  @override
  State<SureCodeScreen> createState() => _SureCodeScreenState();
}

class _SureCodeScreenState extends State<SureCodeScreen> {
  TextEditingController code = TextEditingController();
  // TextEditingController code2 = TextEditingController();
  // TextEditingController code3 = TextEditingController();
  // TextEditingController code4 = TextEditingController();
  // TextEditingController code5 = TextEditingController();
  // TextEditingController code6 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? verifiId;

  @override
  void initState() {
    signWithPhone(widget.phoneText);
    super.initState();
  }

  @override
  void dispose() {
    code.dispose();
    // code2.dispose();
    // code3.dispose();
    // code4.dispose();
    // code5.dispose();
    // code6.dispose();
    super.dispose();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  final focusNode = FocusNode();

  final defaultPinTheme = PinTheme(
      width: 80,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 25,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.secondary),
      ));

  signWithPhone(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        verifiId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  sendCode(String? verificationId) async {
    // Update the UI - wait for the user to enter the SMS code
    try {
      String smsCode = code.text;

      //  code1.text +
      //     code2.text +
      //     code3.text +
      //     code4.text +
      //     code5.text +
      //     code6.text;
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: smsCode);
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          print("phone authhhhhhhhh succcccccessssssss\n");
          NavigationService.goNamed(AppRouter.home);
        } else {
          print("phone authhhhhhhhh errrrrrrrrrror\n");
        }
      });
    } catch (e) {
      print(" errrrrrrrrrrror in phone");
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.5,
                    ),
                    Text(
                      "Enter Code",
                      style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "the sent to number ${widget.phoneText}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Pinput(
                        length: 6,
                        controller: code,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsRetrieverApi,
                        listenForMultipleSmsOnAndroid: true,
                        separatorBuilder: (index) => SizedBox(
                          width: 10,
                        ),
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black),
                        )),
                        
                        focusNode: focusNode,
                        // validator: (value) {
                        //   return value != null ? null : 'Pin is incorrect';
                        // },
                        onCompleted: (pin) {
                          // focusNode.dispose();
                          debugPrint('onCompleteddddddddddddddddddddddddddddddddddddddd: $pin');
                          sendCode(verifiId);
                        },
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 1,
                    //       child: DefultTextFormField(
                    //         keybordType: TextInputType.phone,
                    //         validator: DefultValidation.codeValidation,
                    //         textController: code1,
                    //         cursorColor: AppColors.secondary,
                    //         hintText: "1",
                    //         textAlign: TextAlign.center,
                    //         textStyle: TextStyle(fontSize: 25.0),
                    //         fillColor: Colors.white,
                    //         isFilledColor: true,
                    //         borderSideColor: AppColors.secondary,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: DefultTextFormField(
                    //         keybordType: TextInputType.phone,
                    //         validator: DefultValidation.codeValidation,
                    //         textController: code2,
                    //         cursorColor: AppColors.secondary,
                    //         hintText: "2",
                    //         textAlign: TextAlign.center,
                    //         textStyle: TextStyle(fontSize: 25.0),
                    //         fillColor: Colors.white,
                    //         isFilledColor: true,
                    //         borderSideColor: AppColors.secondary,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: DefultTextFormField(
                    //         keybordType: TextInputType.phone,
                    //         validator: DefultValidation.codeValidation,
                    //         textController: code3,
                    //         cursorColor: AppColors.secondary,
                    //         hintText: "3",
                    //         textAlign: TextAlign.center,
                    //         textStyle: TextStyle(fontSize: 25.0),
                    //         fillColor: Colors.white,
                    //         isFilledColor: true,
                    //         borderSideColor: AppColors.secondary,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: DefultTextFormField(
                    //         keybordType: TextInputType.phone,
                    //         validator: DefultValidation.codeValidation,
                    //         textController: code4,
                    //         cursorColor: AppColors.secondary,
                    //         hintText: "4",
                    //         textAlign: TextAlign.center,
                    //         textStyle: TextStyle(fontSize: 25.0),
                    //         fillColor: Colors.white,
                    //         isFilledColor: true,
                    //         borderSideColor: AppColors.secondary,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: DefultTextFormField(
                    //         keybordType: TextInputType.phone,
                    //         validator: DefultValidation.codeValidation,
                    //         textController: code5,
                    //         cursorColor: AppColors.secondary,
                    //         hintText: "5",
                    //         textAlign: TextAlign.center,
                    //         textStyle: TextStyle(fontSize: 25.0),
                    //         fillColor: Colors.white,
                    //         isFilledColor: true,
                    //         borderSideColor: AppColors.secondary,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: DefultTextFormField(
                    //         keybordType: TextInputType.phone,
                    //         validator: DefultValidation.codeValidation,
                    //         textController: code6,
                    //         cursorColor: AppColors.secondary,
                    //         hintText: "6",
                    //         textAlign: TextAlign.center,
                    //         textStyle: TextStyle(fontSize: 25.0),
                    //         fillColor: Colors.white,
                    //         isFilledColor: true,
                    //         borderSideColor: AppColors.secondary,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 50,
                    ),
                    DefultButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          sendCode(verifiId);
                        }
                      },
                      title: "Send Code",
                      color: AppColors.secondary,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
