import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/DotLine.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/defultButton.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List informationData = ["Transaction ID", "Date", "Time"];
    List informationValue = ["V278439380", "Nov 21 2023", "03:04 PM"];
    List paymentSummaryData = ["Price", "Reward Points", "Total"];
    List paymentSummaryValue = ["\$99.8", "+80", "\$8.55"];
    List methodData = ["Payment Method", "Schedule Pick Up"];
    List methodValue = ["Rewards", "03:15 PM"];
    return SingleChildScrollView(
      child: Container(
        color: AppColors.background,
        padding: const EdgeInsets.all(30),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          child: Column(children: [
            Text(
              "Thank you!",
              style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              // padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 0.5, color: Colors.black)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: informationValue.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Text(
                                  informationData[index],
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  informationValue[index],
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                              ],
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DotLineWidget(),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Item",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Iced Coffee",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "XLarge, 3 Splenda, 6 Pump (s) Pumpkin spice, 3 Shot (s) Espresso, Pumpkin Spice Toppings, Oatmilk, Normal Ice",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black45),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    DotLineWidget(),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment Summary",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: paymentSummaryData.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          paymentSummaryData[index],
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          paymentSummaryValue[index],
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: 20.0,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: methodData.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          methodData[index],
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          methodValue[index],
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ]),
                    )
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            defultButton(onTap: (){
              NavigationService.pushNamed(AppRouter.tracker );
            },
            title: "Tracker Order",
            )
          ]),
        ),
      ),
    );
  }
}

