import 'package:coffee_shop/core/constant/constant.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/modules/home/presentation/widget/favDrink.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 20.0) ,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 10.0),
              child: Text(
                "Your Favorites",
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: favDrinkData.length,
                itemBuilder: (context, index) {
                  return FavDrinkWidget(favDrinkModel: favDrinkData[index] , sizeWidth: 2,);
                },
              ),
            ),
          )
         , SliverToBoxAdapter(
            child: Row(
              children: [  
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 8.0 , vertical: 15.0),
                  child: Text(
                  "Drinks",
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                              ),
                ), 
              Spacer(), 
              Text(
                "See All",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                   ),
              ),


              ],
            ),

          ),
          SliverToBoxAdapter(
            child: ListView.builder( 
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context , index){ 
                return  Container(
                 height: 250,
                  child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: favDrinkData.length,
                              itemBuilder: (context, index) {
                  return FavDrinkWidget(favDrinkModel: favDrinkData[index] , sizeWidth: 3 , isFav: false,);
                              },
                            ),
                );
            
            
            }),
          )
        ],
      ),
    );
  }
}
