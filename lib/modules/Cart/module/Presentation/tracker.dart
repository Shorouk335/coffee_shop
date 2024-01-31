import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/DotLine.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/defultButton.dart';
import 'package:coffee_shop/modules/Cart/module/Presentation/widget/timeLineSteper.dart';
import 'package:flutter/material.dart';

class TrackerWidget extends StatefulWidget {
  const TrackerWidget({super.key});

  @override
  State<TrackerWidget> createState() => _TrackerWidgetState();
}

class _TrackerWidgetState extends State<TrackerWidget> {
  List informationData = ["Transaction ID", "Date", "Time"];
  List informationValue = ["V278439380", "Nov 21 2023", "03:04 PM"];
  List steperData = [
    "Order has been received",
    "Prepare your order",
    "Your order is complete! Meet us at the pickup area"
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(15.0),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tracking order",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: steperData.length,
                    itemBuilder: (context, index) {
                      return TimeLineBuilderWidget(
                          isFirst: index == 0 ? true : false,
                          isLast: index == steperData.length - 1 ? true : false,
                          states: steperData[index],
                          indicator: index == steperData.length - 1
                              ? CircleAvatar(
                                  backgroundColor: AppColors.secondary,
                                  child: Icon(
                                    Icons.file_download_done_outlined,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: AppColors.secondary,
                                ));
                    })
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          DefultButton(
              color: Colors.grey,
              onTap: () {
                NavigationService.pushNamed(AppRouter.invoice);
              },
              title: "Pickup order"),
          SizedBox(
            height: 20.0,
          ),
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
            height: 30,
          ),
          DotLineWidget(),
          const SizedBox(
            height: 30,
          ),
          DefultButton(
              width: MediaQuery.of(context).size.width / 2,
              onTap: () {
                NavigationService.pushNamed(AppRouter.invoice);
              },
              title: "Review Reciept"),
        ]),
      ),
    );
  }
}
