import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int value = 0;
  List valueRadio = ["As Soon as Possible", "Later", "Payment Method"];
  String currentRadio = "As Soon as Possible";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "XLarge, 3 Splenda",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "6 Pump (s) Pumpkin spice",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "3 Shot (s) Espresso",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Pumpkin Spice Toppings",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Oatmilk",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Normal Ice ",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Special Instructions",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Gluten Free, please make sure as I have Celiac Disease",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
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
                                SizedBox(
                                  height: 18,
                                )
                              ],
                            ),
                            SizedBox(
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
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
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
                      Spacer(),
                      Text(
                        "\$9.85",
                        style: TextStyle(fontSize: 25.0),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueRadio[0],
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Now - 10 Minutes",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Radio(
                        // it value
                        value: valueRadio[0],
                        // start value
                        groupValue: currentRadio,
                        onChanged: (value) {
                          // in click in it start value = it is value and wil be click button
                          setState(() {
                            currentRadio = value.toString();
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueRadio[1],
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Schedule Pick Up",
                            style: TextStyle(fontSize: 20.0),
                          )
                        ],
                      ),
                      Spacer(),
                      Radio(
                        value: valueRadio[1],
                        groupValue: currentRadio,
                        onChanged: (value) {
                          setState(() {
                            currentRadio = value.toString();
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueRadio[2],
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Apple Pay",
                            style: TextStyle(fontSize: 20.0),
                          )
                        ],
                      ),
                      Spacer(),
                      Radio(
                        value: valueRadio[2],
                        groupValue: currentRadio,
                        onChanged: (value) {
                          setState(() {
                            currentRadio = value.toString();
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Icon(Icons.square , color: AppColors.secondary,),
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
                            child: Center(
                              child: Icon(
                                Icons.location_city,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
