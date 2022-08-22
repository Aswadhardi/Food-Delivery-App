import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/pages/home/home.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import '../../controllers/popular_product_controller.dart';
import '../../widgets/big_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.previousRoute;
                                      },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    backgroundColor: AppColor.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconsize24,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width20,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>Home());
                  },
                  child: AppIcon(
                    icon: Icons.home,
                    iconSize: Dimensions.iconsize24,
                    backgroundColor: AppColor.mainColor,
                    iconColor: Colors.white,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconSize: Dimensions.iconsize24,
                  backgroundColor: AppColor.mainColor,
                  iconColor: Colors.white,
                )
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              // color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartContoller) {
                  return ListView.builder(
                    itemCount: cartContoller.getItems.length,
                    itemBuilder: ((_, index) {
                      return Container(
                        height: Dimensions.height20 * 5,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              height: Dimensions.height20 * 5,
                              width: Dimensions.height20 * 5,
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.height10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  image:  DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartContoller.getItems[index].img!
                                          ))),
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                      text: cartContoller.getItems[index].name!,
                                      color: Colors.black54,
                                    ),
                                    SmallText(text: 'Spicy'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text: '\$ ${cartContoller.getItems[index].price!.toString()}',
                                          color: Colors.redAccent,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: Dimensions.height10,
                                              left: Dimensions.width10,
                                              right: Dimensions.width10,
                                              bottom: Dimensions.height10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius15),
                                            color:
                                                AppColor.buttonBackgroundColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () => {
                                                  // popularProduct.setQuantity(false)
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  size: Dimensions.iconsize24,
                                                  color: AppColor.signColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: Dimensions.width5,
                                              ),
                                              BigText(text: "500"
                                                  // popularProduct.inCartItems.toString()
                                                  ),
                                              SizedBox(
                                                width: Dimensions.width5,
                                              ),
                                              GestureDetector(
                                                onTap: () => {
                                                  // popularProduct.setQuantity(true)
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  size: Dimensions.iconsize24,
                                                  color: AppColor.signColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: Dimensions.height10),
          width: double.maxFinite,
          height: Dimensions.bottomNavigationBar,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                  topLeft: Radius.circular(Dimensions.radius20 * 2)),
              color: AppColor.buttonBackgroundColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: AppColor.buttonBackgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        // .setQuantity(false)
                      },
                      child: Icon(
                        Icons.remove,
                        size: Dimensions.iconsize24,
                        color: AppColor.signColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    BigText(text: 'ASWAD'
                        // popularProduct.inCartItems.toString()
                        ),
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    GestureDetector(
                      onTap: () => {
                        // popularProduct.setQuantity(true)
                      },
                      child: Icon(
                        Icons.add,
                        size: Dimensions.iconsize24,
                        color: AppColor.signColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColor.mainColor,
                  ),
                  child: const BigText(
                    text: '\$  | Add to cart',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
