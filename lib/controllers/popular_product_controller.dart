import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/model/products_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  int _quantity = 0;

  int get quantity => _quantity;
  int _inCartItems = 0;

  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print('hahah error no response');
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkedQuantity(_quantity + 1);
    } else {
      _quantity = checkedQuantity(_quantity - 1);
    }
    update();
  }

  int checkedQuantity(quantity) {
    if ((_inCartItems+quantity) < 0) {
      Get.snackbar('Item count', "You can't reduce more",
          backgroundColor: AppColor.mainColor, colorText: Colors.white);
      return 0;
    } else if ((_inCartItems+quantity) > 20) {
      Get.snackbar('Item count', "You can't exceed 20",
          backgroundColor: AppColor.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initializeProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = cart.exitsInCart(product);
    print('exist is true or not' + exist.toString());
    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }
    print('the quantity in the cart is '+ _inCartItems.toString());
  }

  void addItems(ProductModel product) {
    if (quantity > 0) {
      _cart.addItems(product, _quantity);
      _quantity = 0;
      _cart.items.forEach((key, value) {
        return print(
            '${key.toString()} The id is ${value.id.toString()}and the quantity is  ${value.quantity.toString()}');
      });
    } else {
      Get.snackbar('Item count', 'You should at least add an item',
          backgroundColor: AppColor.mainColor, colorText: Colors.white);
    }
  }
}
