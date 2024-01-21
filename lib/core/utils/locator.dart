import 'package:coffee_shop/core/router/router.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator(){ 

  locator.registerSingleton<AppRouter>(AppRouter());

}