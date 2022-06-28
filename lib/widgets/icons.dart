import 'package:flutter/material.dart';
import 'package:food11/widgets/dimentions.dart';
import 'package:food11/widgets/smalltext.dart';

class IconsClass extends StatelessWidget {
  final IconData icon;
  // final Color color;
  final Color iconcolor;
  final String text;
  const IconsClass(
      {Key? key,
      required this.icon,
      // required this.color,
      required this.iconcolor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconcolor,
          size: Dimensions.icon24,
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
