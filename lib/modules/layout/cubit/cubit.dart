import 'package:coffee_shop/modules/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialLayoutState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  late TabController? tabController;

  changeTabController(int tab) {
    tabController!.animateTo(tab);
    emit(ChangeTabControllerState());
  }
}
