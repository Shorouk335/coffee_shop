import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> titleList = [
    "Choose and customize your drinks with simplicity",
    "No time to waste when you need your coffee",
    "Who doesn’t love rewards? We LOVE rewards!"
  ];
  List<String> discList = [
    "You want your drink and you want it your way so be bold and customize the way that makes you the happiest!",
    "We’ve crafted a quick and easy way for you to order your favorite coffee or treats thats fast!",
    "If you’re like us you love getting freebies and rewards! That’s why we have the best reward program in the coffee game!"
  ];
  PageController pageController = PageController();
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.onBackground,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.onBackground,
          body: PageView.builder(
            controller: pageController,
            itemCount: titleList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                color: AppColors.onBackground,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                NavigationService.pushReplacement(
                                  AppRouter.home,
                                );
                              },
                              child: Text("Skip",
                                  style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 3,
                        child: SvgIcon(
                          svg: "cup".svg(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Text(
                              titleList[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              discList[index],
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgIcon(
                              svg: "coffee${index + 1}".svg(),
                              width: 120,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                if (indexPage == titleList.length - 1) {
                                  NavigationService.pushReplacement(
                                    AppRouter.home,
                                  );
                                } else {
                                  pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 18.0),
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            onPageChanged: (s) {
              setState(() {
                indexPage = s;
              });
            },
          ),
        ),
      ),
    );
  }
}
