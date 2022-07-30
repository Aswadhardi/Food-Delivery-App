import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimension.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overFlow;

  const BigText(
      {Key? key,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontFamily: 'Roboto',
            fontSize: size == 0 ? Dimensions.font20 : size,
            color: color,
            overflow: overFlow),
        maxLines: 1);
  }
}
