import 'package:coffee_shop/core/constant/constant.dart';
import 'package:coffee_shop/core/constant/model/favDrinkModel.dart';
import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/modules/home/presentation/widget/bonus_rewords.dart';
import 'package:coffee_shop/modules/home/presentation/widget/welcome_widget.dart';
import 'package:coffee_shop/modules/home/presentation/widget/favDrink.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container( 
      padding: EdgeInsets.all(15.0),
      color: AppColors.background ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WelcomeWidget(),
          SizedBox(height: 20),
          Expanded(child: BounsRewordsWidget()),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Your Favorites",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favDrinkData.length,
                  itemBuilder: (context, index) {
                    return FavDrinkWidget(
                      favDrinkModel: favDrinkData[index],
                      sizeWidth: 2,
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


// CustomScrollView(
//         slivers: [
//             const SliverToBoxAdapter(
//             child: SizedBox(height: 15),
//           ), 
//           const SliverToBoxAdapter(
//             child: WelcomeWidget(),
//           ), 
//            const SliverToBoxAdapter(
//             child: SizedBox(height: 30),
//           ), 
//           const SliverToBoxAdapter(
//             child: BounsRewordsWidget(),
//           ), 
//            const SliverToBoxAdapter(
//             child: SizedBox(height: 30),
//           ), 
//           const SliverToBoxAdapter(
//             child: Text("Your Favorites" , style: TextStyle(
//               color: Colors.black , 
//               fontSize: 28.0 , 
//               fontWeight: FontWeight.bold

//             ),),
//           ), 
//           SliverToBoxAdapter(
//           child: Container(
//             height: 280,

//             child:ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: favDrinkData.length,
//                     itemBuilder: (context, index) {
//                       return FavDrinkWidget(favDrinkModel: favDrinkData[index] , sizeWidth: 2,);
//                     },
//                   ),
//           ),
//         ),


//         ],
//       ),
