import 'package:coffee_shop/core/constant/model/favDrinkModel.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/modules/DrinkDetails/cubit/cubit.dart';
import 'package:coffee_shop/modules/DrinkDetails/cubit/states.dart';
import 'package:coffee_shop/modules/DrinkDetails/presentation/widget/counterWidget.dart';
import 'package:coffee_shop/modules/DrinkDetails/presentation/widget/dropDownWidget.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkDetailsScreen extends StatefulWidget {
  const DrinkDetailsScreen({super.key, required this.favDrinkModel});
  final FavDrinkModel favDrinkModel;

  @override
  State<DrinkDetailsScreen> createState() => _DrinkDetailsScreenState();
}

class _DrinkDetailsScreenState extends State<DrinkDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrinkDetailsCubit(),
      child: BlocConsumer<DrinkDetailsCubit, DrinkDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            color: AppColors.background,
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 150,
                  color: AppColors.secondary,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SvgIcon(
                          svg: widget.favDrinkModel.img.svg(),
                          width: 60,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          widget.favDrinkModel.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("What's included",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0)),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropDownWidget(
                        title: "Cup Size",
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DropDownWidget(title: "Add-Ins", isCup: false ,),
                      SizedBox(
                        height: 30,
                      ),
                      CounterWidget(),
                        SizedBox(
                        height: 30,
                      ),
                      CounterWidget(isSweeter: false,)
                    
                    ],
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
