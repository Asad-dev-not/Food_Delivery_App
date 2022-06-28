import 'package:flutter/material.dart';
import 'package:food11/widgets/dimentions.dart';

class BigText extends StatelessWidget {
  Color? colour;
  String text;
  double size;
  TextOverflow overflow;
  BigText(
      {Key? key,
      this.colour = const Color(0xFF89dad0),
      this.size = 0,
      required this.text,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          color: colour,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontFamily: 'Pacifico'),
    );
  }
}
