import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableTextWidgets extends StatefulWidget {
  final String text;

  const ExpandableTextWidgets({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidgets> createState() => _ExpandableTextWidgetsState();
}

class _ExpandableTextWidgetsState extends State<ExpandableTextWidgets> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(color: AppColor.paraColor, text: firstHalf)
          : Column(
              children: [
                SmallText(
                  color: AppColor.paraColor,
                  height: 1.8,
                  text: hiddenText ? firstHalf + '...' : firstHalf + secondHalf,
                  size: Dimensions.font15,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children:  [
                       const SmallText(
                        text: 'show more',
                        color: AppColor.mainColor,
                      ),
                      Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColor.mainColor)
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
