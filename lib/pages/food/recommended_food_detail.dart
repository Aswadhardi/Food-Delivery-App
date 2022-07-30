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
                  padding: EdgeInsets.only(top: 5, bottom: 10),
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
                  margin:  EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
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
     "crunchy" and "juicy", as wchicken has Fried chickcken has s wchicken has been described as being "crunchy" and "juicy", as wchicken has Fried 
      chicken has been described as being "crunchy" and "juicy", as wchicken has been described as being 
      "crunchy" and "juicy", as wchicken has Fried chicken hased chicken has been described as being "crunchy" and "juicy",
  as wchicken has been described as being "crunchy" and "juicy", 
   wchicken has Fried chicken has been described as being "crunchy" and "juicy", 
   as wchicken has been described as being "crunchy" and "juicy", as wchicken has Fried chicken
    has been described as being "crunchy" and "juicy", as wchicken has been described as being
     "crunchy" and "juicy", as wchicken has Fried chickcken has s wchicken has been described as being "crunchy" and "juicy", as wchicken has Fried 
      chicken has been described as being "crunchy" and "juicy", as wchicken has been described as being 
      "crunchy" and "juicy", as wchicken has Fried chicken hased chicken has been described as being "crunchy" and "juicy",
  as wchicken has been described as being "crunchy" and "juicy", 
   wchicken has Fried chicken has been described as being "crunchy" and "juicy", 
   as wchicken has been described as being "crunchy" and "juicy", as wchicken has Fried chicken
    has been described as being "crunchy" and "juicy", as wchicken has been described as being
     "crunchy" and "juicy", as wchicken has Fried chicken has been described as being "crunchy"
      and "juicy", as wchicken has been described as being "crunchy" and "juicy", as wchicken has Fried 
      chicken has been described as being "crunchy" and "juicy", as wchicken has been described as being 
      "crunchy" and "juicy", as wchicken has Fried chicken has been described as being "crunchy" and "juicy",
       as wchicken has been described as being "crunchy" and "juicy", as wchicken has Fried chicken has been described
        as being "crunchy" and "juicy", as wchicken has been described as being "crunchy" and "juicy", as wchicken has'''),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
