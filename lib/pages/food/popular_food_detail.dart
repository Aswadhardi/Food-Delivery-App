import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:get/get.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widgets.dart';
import '../home/home.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    print("page is  id " + pageId.toString());
    print('product name is ' + product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                      AppConstants.BASE_URL + "/uploads/" + product.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //icons widgets at top
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const Home());
                      },
                      child: const AppIcon(
                        icon: Icons.arrow_back_ios_new,
                      )),
                  GetBuilder<PopularProductController>(
                    builder: (controller) {
                      return Stack(
                        children: [
                          const AppIcon(
                            icon: Icons.shopping_cart,
                          ),
                          Get.find<PopularProductController>().totalItems >= 1
                              ?  Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: Dimensions.height20,
                                    backgroundColor: AppColor.mainColor,
                                    iconColor: Colors.transparent,
                                  ),
                                )
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 4.8,
                                  top: 3,

                                  child: BigText(
                                      size: 12,
                                      color: Colors.white,
                                      text: Get.find<PopularProductController>()
                                          .totalItems
                                          .toString()),
                                )
                              : Container()
                        ],
                      );
                    },
                  )
                ],
              )),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    bigTextlabel: product.name!,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  const BigText(text: 'Introduce'),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidgets(text: product.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //  Expandable Text widgets
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
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
                      onTap: () => {popularProduct.setQuantity(false)},
                      child: Icon(
                        Icons.remove,
                        size: Dimensions.iconsize24,
                        color: AppColor.signColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    GestureDetector(
                      onTap: () => {popularProduct.setQuantity(true)},
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
                onTap: () => popularProduct.addItem(product),
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
                    child: BigText(
                      text: '\$ ${product.price!} | Add to cart',
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
