import 'package:flutter/material.dart';
import 'package:food11/widgets/dimentions.dart';

class SmallText extends StatelessWidget {
  Color? colour;
  String text;
  double size;
  double height;
  SmallText({
    Key? key,
    this.colour = const Color(0xFF5c524f),
    this.size = 0,
    this.height = 1.3,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: colour,
          fontSize: size == 0 ? Dimensions.font12 : size,
          fontFamily: 'Roboto',
          height: height),
    );
  }
}
