import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widgets.dart';
import '../../controllers/cart_controller.dart';
import '../../widgets/app_icon.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: const AppIcon(
                    icon: Icons.clear,
                  ),
                ),
                // const AppIcon(
                //   icon: Icons.shopping_cart,
                // )
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap:() {
                            Get.to(()=>const CartPage());
                          },
                          child: const AppIcon(
                            icon: Icons.shopping_cart,
                          ),
                        ),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
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
            ),
            pinned: true,
            expandedHeight: 300,
            bottom: PreferredSize(
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                  child: Center(
                    child: BigText(
                      text: product.name!,
                      size: Dimensions.font26,
                    ),
                  ),
                ),
                preferredSize: const Size.fromHeight(20)),
            backgroundColor: AppColor.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidgets(text: product.description!),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: ((controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20 * 2.5,
                    right: Dimensions.width20 * 2.5,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {controller.setQuantity(false)},
                      child: const AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColor.mainColor,
                        iconColor: Colors.white,
                      ),
                    ),
                    BigText(
                      text:
                          "\$ ${product.price}   X  ${controller.inCartItems} ",
                      color: AppColor.mainBlackColor,
                      size: Dimensions.font26,
                    ),
                    GestureDetector(
                      onTap: () => {controller.setQuantity(true)},
                      child: const AppIcon(
                          icon: Icons.add,
                          backgroundColor: AppColor.mainColor,
                          iconColor: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: Dimensions.iconsize24,
                        color: AppColor.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {controller.addItem(product)},
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColor.mainColor,
                        ),
                        child: BigText(
                          text:
                              '\$${product.price * controller.quantity} | Add to cart',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
