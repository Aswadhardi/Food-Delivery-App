import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimension.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String bigTextlabel;
  // final String smallTextlabel;
  // final IconData icon;
  // final double height;

  const AppColumn({
    Key? key,
    required this.bigTextlabel,
    // required this.smallTextlabel,
    // required this.icon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         BigText(
          text: bigTextlabel,size:  Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
                children: List.generate(
                    5,
                    (index) => const Icon(
                          Icons.star_rate,
                          color: AppColor.mainColor,
                          size: 15,
                        ))),
            SizedBox(width: Dimensions.width10),
             const SmallText(text: '4.5'),
            SizedBox(width: Dimensions.width10),
             const SmallText(text: '1200'),
            SizedBox(width: Dimensions.width10),
             const SmallText(text: 'comments'),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  const [
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
    );
  }
}
