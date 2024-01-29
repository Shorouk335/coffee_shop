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
  

   changeCupSize (String? size){
    cupSize = size ;
    emit(ChangeCupSizeState());

   }
   changeAddIns (String? ins){
    addIns = ins ;
    emit(ChangeAddInsState());

   }


  increaseSweetenerValue() {
   sweetenerValue ++ ;
    emit(IncreaseSweetenerValueState());
  }

  increaseFlavorValue() {
    flavorValue++;
    emit(IncreaseFlavorValueState());
  }

  decreaseSweetenerValue() {
    sweetenerValue--;
    emit(DecreaseSweetenerValueState());
  }

  decreaseFlavorValue() {
    flavorValue--;
    emit(DecreaseFlavorValueState());
  }
}
