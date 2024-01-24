import 'package:coffee_shop/modules/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialLayoutState());

  static LayoutCubit get(context) => BlocProvider.of(context);


  int clickTab = 0 ;

  // late TabController? tabController = TabController(
  //       length: 5,  initialIndex: 0, vsync: Tra);

  changeClickTab(int tab) {
    clickTab = tab ;
    emit( ChangeClickTabState());
  }
}
