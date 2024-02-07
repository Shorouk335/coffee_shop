import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/validation.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/defultButton.dart';
import 'package:coffee_shop/shared/widget/textFormField.dart';
import 'package:flutter/material.dart';

class EnterPhoneScreen extends StatefulWidget {
  const EnterPhoneScreen({super.key});

  @override
  State<EnterPhoneScreen> createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.5,
                    ),
                    Text(
                      "Enter your Phone",
                      style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "for privacy , we will send you SMS code to ensure your in formation",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    DefultTextFormField(
                     
                      textStyle: TextStyle(fontSize: 23.0),
                      keybordType: TextInputType.phone,
                       validator: DefultValidation.defaultValidation ,
                      aroundContainerPadding: EdgeInsets.only(top: 8),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 25 ,  horizontal: 20),
                      textController: phone,
                      cursorColor: AppColors.secondary,
                      labelText: "Phone",
                      labelStyle:
                          TextStyle(color: AppColors.secondary, fontSize: 20.0),
                      fillColor: Colors.white,
                      isFilledColor: true,
                      borderSideColor: AppColors.secondary,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    DefultButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          NavigationService.pushNamed(AppRouter.code , extra: phone.text);
                        }
                      },
                      title: "Send Phone",
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
