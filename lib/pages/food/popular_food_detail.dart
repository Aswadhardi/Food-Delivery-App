import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';

import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widgets.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('assets/images/vegetables_fries_plate.jpg'),
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
                children: const [
                  AppIcon(
                    icon: Icons.arrow_back_ios_new,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
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
                  const AppColumn(
                    bigTextlabel: 'Hot Fried Rice',
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  const BigText(text: 'Introduce'),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  const Expanded(

                      child: SingleChildScrollView(

                          child: ExpandableTextWidgets(

                            text: 'Fried chicken has been described as being "crunchy" and "juicy", as wchicken has been described as being "crunchy" and "juicy", as wchicken has been described as being "crunchy" and "juicy", as well as "crispy". The dish has also been called "spicy"being "crunchy" and "juicy", as well as "crispy". The dish has also been called "spicy"being "crunchy" and "juicy", as well as "crispy". The dish has also been called "spicy" and "salty". Occasionally, fried chicken is also topped with chili like paprika, or hot sauce to give it a spicy taste',
                          ),
                      ),
                  ),

                ],
              ),
            ),
          ),
          //  Expandable Text widgets

        ],
      ),
      bottomNavigationBar: Container(
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
                  Icon(
                    Icons.remove,
                    size: Dimensions.iconsize24,
                    color: AppColor.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  const BigText(text: '0'),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  Icon(
                    Icons.add,
                    size: Dimensions.iconsize24,
                    color: AppColor.signColor,
                  )
                ],
              ),
            ),
            Container(
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
                text: '\$0 | Add to cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
