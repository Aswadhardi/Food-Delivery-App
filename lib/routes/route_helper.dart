import 'package:food_delivery/pages/home/home.dart';
import 'package:get/get.dart';

import '../pages/food/popular_food_detail.dart';
class RoutesHelper{
  static const String initilal='/' ;
  static const String popularFood ='popular-food';

  static List <GetPage> routes =[
    GetPage(name:"/",page: ()=> Home()),
    GetPage(name:popularFood,page: ()=> PopularFoodDetail()),
  ];

}