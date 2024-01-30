import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int value = 0;
  List cupDataList = [
    "XLarge, 3 Splenda",
    "Special Instructions",
    "Normal Ice ",
    "Oatmilk",
    "Pumpkin Spice Toppings",
    "Gluten Free, please make sure as I have Celiac Disease"
  ];
  List valueRadio = ["As Soon as Possible", "Later", "Payment Method"];
  List subValueRadio = ["Now - 10 Minutes", "Schedule Pick Up", "Apple Pay"];
  String currentRadio = "As Soon as Possible";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Iced Coffee",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "\$6.99",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cupDataList.length,
                    itemBuilder: (context, index) {
                      return Column( 
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cupDataList[index],
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      );
                    },
                  ),
                    const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(width: 1.0, color: Colors.grey)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    value--;
                                  },
                                  child: Icon(
                                    Icons.minimize,
                                    size: 30.0,
                                    color: AppColors.onPrimary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                height: 40,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    value.toString(),
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  value++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: AppColors.onPrimary,
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "\$9.85",
                        style: TextStyle(fontSize: 25.0),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: valueRadio.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueRadio[index],
                                    style: const TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    subValueRadio[index],
                                    style: const TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Radio(
                                value: valueRadio[index],
                                groupValue: currentRadio,
                                onChanged: (value) {
                                  setState(() {
                                    currentRadio = value.toString();
                                  });
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){ 
                      NavigationService.pushNamed(AppRouter.invoice);
                    },
                    child: Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                       decoration: BoxDecoration(
                                color: Colors.white,
                                 borderRadius: BorderRadius.circular(10.0),
                              ),
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                               
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.dashboard,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.push_pin,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
