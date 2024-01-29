import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/modules/DrinkDetails/cubit/cubit.dart';
import 'package:coffee_shop/modules/DrinkDetails/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, this.isSweeter = true});
  final bool isSweeter;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrinkDetailsCubit , DrinkDetailState>(
      listener: (context , state){},
      builder: (context , state){ 
        final cubit = DrinkDetailsCubit.get(context);
        return   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.isSweeter ? "Sweetener" : "Flavor",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container( 
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.isSweeter ? cubit.sweetener : cubit.flavor,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                      
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
                                Visibility(
                                  visible: cubit.sweetenerValue >=0,
                                  child: InkWell(
                                    onTap: () {
                                       if (widget.isSweeter){
                                        cubit.decreaseSweetenerValue();
                                       }else{
                                        cubit.decreaseFlavorValue();
                                       }
                                    },
                                    child: Icon(
                                      Icons.minimize,
                                      size: 30.0,
                                      color: AppColors.onPrimary,
                                    ),
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
                                    border:
                                        Border.all(width: 1, color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    widget.isSweeter
                                        ? cubit.sweetenerValue.toString()
                                        : cubit.flavorValue.toString(),
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
                                if( widget.isSweeter){
                                  cubit.increaseSweetenerValue() ;
                                }else{
                                  cubit.increaseFlavorValue();
                                }
                              
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
                  
                  
                  
                  
                  
                    )
                  ]),
            ),
          ),
        ],
      );
      },
     
    );
  }
}
