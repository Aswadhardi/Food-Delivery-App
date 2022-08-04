import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/model/products_model.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import '../../widgets/icon_and_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  final _height = Dimensions.pageViewContainer;
  var _currPageValue = 0.0;
  final _scaleFactor = 0.8;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? GestureDetector(
                  onTap: () {
                    Get.to(() => const PopularFoodDetail());
                  },
                  child: Container(
                    height: Dimensions.pageView,
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: popularProducts.popularProductList.length,
                        itemBuilder: (BuildContext context, position) {
                          return _buildPageItem(position,
                              popularProducts.popularProductList[position]);
                        }),
                  ),
                )
              : const CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        }),
        // Dot indicator
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length <= 0
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColor.mainColor,
              size: const Size.square(9),
              activeSize: const Size(18, 9),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Recommended'),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(
                  text: '.',
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: const SmallText(text: 'Food pairing'),
              ),
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const RecommendedFoodDetail());
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height15),
                        child: Row(
                          children: [
                            //IMAGE CONTAINER
                            Container(
                              width: Dimensions.listViewSize,
                              height: Dimensions.listViewSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        recommendedProduct
                                            .recommendedProductList[index]
                                            .img!),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            // TEXT CONTAINER
                            Expanded(
                              child: Container(
                                  margin:
                                      EdgeInsets.only(left: Dimensions.width10),
                                  height: Dimensions.listViewTextContsize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            Dimensions.radius20),
                                        bottomRight: Radius.circular(
                                            Dimensions.radius20)),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.width10),
                                      child: Column(
                                        children: [
                                          BigText(
                                            text: recommendedProduct
                                                .recommendedProductList[index]
                                                .name!,
                                          ),
                                          SizedBox(height: Dimensions.height10),
                                          const SmallText(text: 'hello World'),
                                          // text: recommendedProduct.recommendedProductList[index].description!),
                                          SizedBox(height: Dimensions.height10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              IconAndTextWidget(
                                                icon: Icons.circle_sharp,
                                                iconColor: AppColor.iconColor1,
                                                text: 'Normal',
                                              ),
                                              IconAndTextWidget(
                                                icon: Icons.location_pin,
                                                iconColor: AppColor.mainColor,
                                                text: '1.2km',
                                              ),
                                              IconAndTextWidget(
                                                icon: Icons.timer_sharp,
                                                iconColor: AppColor.iconColor2,
                                                text: '32min',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ))),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int position, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();

    if (position == _currPageValue.floor()) {
      var _currScale = 1 + (_currPageValue - position) * (1 - _scaleFactor);
      var _currTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    } else if (position == _currPageValue.floor() + 1) {
      var _currScale =
          _scaleFactor + (_currPageValue - position + 1) * (1 - _scaleFactor);
      var _currTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    } else if (position == _currPageValue.floor() - 1) {
      var _currScale =
          _scaleFactor + (_currPageValue - position - 1) * (1 - _scaleFactor);
      var _currTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    } else {
      var _currScale = _scaleFactor;
      var _currTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.width5,
                right: Dimensions.width5,
                top: Dimensions.height15),
            height: Dimensions.pageViewContainer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: position.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF632acf),
                image: DecorationImage(
                  image: NetworkImage(AppConstants.BASE_URL +
                      "/uploads/" +
                      popularProduct.img!),
                  fit: BoxFit.cover,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewText,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      offset: Offset(5, 0),
                      blurRadius: 5.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      right: Dimensions.width15,
                      left: Dimensions.width15),
                  child: AppColumn(
                    bigTextlabel: popularProduct.name!,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
