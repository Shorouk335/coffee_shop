import 'package:coffee_shop/modules/DrinkDetails/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkDetailsCubit extends Cubit<DrinkDetailState> {
  DrinkDetailsCubit() : super(InitialDrinkDetailState());

  static DrinkDetailsCubit get(context) =>
      BlocProvider.of<DrinkDetailsCubit>(context);

  //DATA
  String? cupSize = "Large";
  String? addIns = "Normal Ice";
  String sweetener = "Splenda® packet";
  String flavor = "Pumkin Spice";
  int sweetenerValue = 0;
  int flavorValue = 0;

  //lIST OF DROPDOWN
  List<String> cupSizeList = ["Large", "Meduim", "Small"];
  List<String> addInsList = ["Normal Ice", "Cold Ice"];
}
