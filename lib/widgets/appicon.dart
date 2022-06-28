import 'package:flutter/cupertino.dart';
import 'package:food11/widgets/dimentions.dart';

class AppIcon extends StatelessWidget {
  final IconData micon;
  final Color BackgroundColor;
  final Color miconColor;
  final double size;
  AppIcon({
    Key? key,
    required this.micon,
    this.BackgroundColor = const Color(0xFF9a5e17),
    this.miconColor = const Color(0xFFdaded0),
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: BackgroundColor),
      child: Icon(
        micon,
        color: miconColor,
        size: Dimensions.icon16,
      ),
    );
  }
}
