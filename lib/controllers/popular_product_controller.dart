import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/model/products_model.dart';
import 'package:get/get.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;
  int _quantity=0;
  int get quantity => _quantity;
  int _inCartItems=0;
  int get inCartItems => _inCartItems+_quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {

      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded =true;
      update();
    }else{
      print('hahah error no response');
    }
  }
  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity=checkedQuantity(_quantity+1);
    }else{
      _quantity=checkedQuantity(_quantity-1);
    }
    update();
  }

  int checkedQuantity(quantity) {
    if(quantity<=0){
      Get.snackbar('Item count', "You can't reduce more");
      return 0;
    }else if (quantity>=20){
      Get.snackbar('Item count', "You can't exceed 20");
      return 20;
    }else{
      return quantity;
    }
  }
  void initializeProduct(CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart=cart;
  }
  void addItems(ProductModel product){
    _cart.addItems(product, _quantity);
  }
}
