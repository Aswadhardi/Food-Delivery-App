import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/model/products_model.dart';
import 'package:get/get.dart';

import '../model/cart_model.dart';
class CartController extends GetxController{
  final  CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int ,CartModel> _items={};
  void addItems(ProductModel product,int quantity){

    _items.putIfAbsent(product.id!, ()=> CartModel(
        id:product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity  ,
          isExit: true,
          time: DateTime.now().toString()
    ));

  }

}