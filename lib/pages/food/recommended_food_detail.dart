import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widgets.dart';
import '../../widgets/app_icon.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(
                  icon: Icons.clear,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
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
                      text: 'American dish',
                      size: Dimensions.font26,
                    ),
                  ),
                ),
                preferredSize: const Size.fromHeight(20)),
            backgroundColor: AppColor.yellowColor,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                  image: AssetImage('assets/images/food1.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: const ExpandableTextWidgets(text: '''
 Fried chicken has been described as being "crunchy" and "juicy",
  as chicken has been described as being "crunchy" and "juicy", 
   chicken has Fried chicken has been described as being "crunchy" and "juicy", 
   as chicken has been described as being "crunchy" and "juicy", as chicken has Fried chicken
    has been described as being "crunchy" and "juicy", as chicken has been described as being
     "crunchy" and "juicy", as chicken has Fried chicken has been described as being "crunchy"
      and "juicy", as chicken has been described as being "crunchy" and "juicy", as chicken has Fried 
      chicken has been described as being "crunchy" and "juicy", as chicken has been described as being 
      "crunchy" and "juicy", as chicken has Fried chicken hashed chicken has been described as being "crunchy" and "juicy",
  as chicken has been described as being "crunchy" and "juicy",
   chicken has Fried chicken has been described as being "crunchy" and "juicy",
   as chicken has been described as being "crunchy" and "juicy", as chicken has Fried chicken
    has been described as being "crunchy" and "juicy", as chicken has been described as being
     "crunchy" and "juicy", as chicken has Fried chicken has been described as being "crunchy"
      and "juicy", as chicken has been described as being "crunchy" and "juicy", as chicken has Fried 
      chicken has been described as being "crunchy" and "juicy", as chicken has been described as being 
      "crunchy" and "juicy", as chicken has s chicken has been described as being "crunchy" and "juicy", as chicken has Fried 
      chicken has been described as being "crunchy" and "juicy", as chicken has been described as being 
      "crunchy" and "juicy", as chicken has Fried chicken hashed chicken has been described as being "crunchy" and "juicy",
  as chicken has been described as being "crunchy" and "juicy", 
   chicken has Fried chicken has been described as being "crunchy" and "juicy", 
   as chicken has been described as being "crunchy" and "juicy", as chicken has Fried chicken
    has been described as being "crunchy" and "juicy", as wchicken has been described as being
     "crunchy" and "juicy", as wchicken has Fried chickcken has s chicken has been described as being "crunchy" and "juicy", as chicken has Fried 
      chicken has been described as being "crunchy" and "juicy", as wchicken has been described as being 
      "crunchy" and "juicy", as wchicken has Fried chicken hased chicken has been described as being "crunchy" and "juicy",
  as wchicken has been described as being "crunchy" and "juicy", 
   chicken has Fried chicken has been described as being "crunchy" and "juicy", 
   as wchicken has been described as being "crunchy" and "juicy", as chicken has Fried chicken
    has been described as being "crunchy" and "juicy", as chicken has been described as being
     "crunchy" and "juicy", as chicken has Fried chicken has s chicken has been described as being "crunchy" and "juicy", as chicken has Fried 
      chicken has been described as being "crunchy" and "juicy", as chicken has been described as being 
      "crunchy" and "juicy", as chicken has Fried chicken hashed chicken has been described as being "crunchy" and "juicy",
  as chicken has been described as being "crunchy" and "juicy", 
   chicken has Fried chicken has been described as being "crunchy" and "juicy", 
   as chicken has been described as being "crunchy" and "juicy", as chicken has Fried chicken
    has been described as being "crunchy" and "juicy", as chicken has been described as being
     "crunchy" and "juicy", as chicken has Fried chicken has been described as being "crunchy"
      and "juicy", as chicken has been described as being "crunchy" and "juicy", as chicken has Fried 
      chicken has been described as being "crunchy" and "juicy", as chicken has been described as being 
      "crunchy" and "juicy", as chicken has Fried chicken has been described as being "crunchy" and "juicy",
       as chicken has been described as being "crunchy" and "juicy", as chicken has Fried chicken has been described
        as being "crunchy" and "juicy", as chicken has been described as being "crunchy" and "juicy", as chicken has'''),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColor.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: "\$12.55 "+" X "+" 0 ",
                  color: AppColor.mainBlackColor,
                  size: Dimensions.font26,
                ),
                const AppIcon(
                    icon: Icons.add,
                    backgroundColor: AppColor.mainColor,
                    iconColor: Colors.white),
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
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    size: Dimensions.iconsize24,
                    color: AppColor.mainColor,
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
        ],
      ),
    );
  }
}
