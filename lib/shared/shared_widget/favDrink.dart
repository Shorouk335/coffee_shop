import 'package:coffee_shop/core/constant/model/favDrinkModel.dart';
import 'package:coffee_shop/core/router/navigation_service.dart';
import 'package:coffee_shop/core/router/router.dart';
import 'package:coffee_shop/core/utils/extension.dart';
import 'package:coffee_shop/shared/widget/svgIcon.dart';
import 'package:flutter/material.dart';

class FavDrinkWidget extends StatelessWidget {
  const FavDrinkWidget(
      {super.key, required this.favDrinkModel, required this.sizeWidth , this.isFav = true});
  final FavDrinkModel favDrinkModel;
  final double sizeWidth; 
  final bool isFav ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.pushNamed(
           AppRouter.drinkDetails,
            extra: favDrinkModel
            //  { 
            //   "favDrinkModel" :favDrinkModel
            // }  
            
             );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Container(
          height: 250,
          width: MediaQuery.of(context).size.width / sizeWidth,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            children: [
              if (isFav)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 35.0,
                    color: favDrinkModel.isFav ? Colors.red : Colors.grey,
                  )
                ],
              ),
              Expanded(
                child: SvgIcon(
                  svg: favDrinkModel.img.svg(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                favDrinkModel.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w400),
              ), 
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
