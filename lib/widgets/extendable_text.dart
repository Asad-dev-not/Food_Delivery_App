import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food11/widgets/colors.dart';
import 'package:food11/widgets/dimentions.dart';
import 'package:food11/widgets/smalltext.dart';

class ExtendAbleText extends StatefulWidget {
  final String likhna;
  const ExtendAbleText({Key? key, required this.likhna}) : super(key: key);

  @override
  State<ExtendAbleText> createState() => _ExtendAbleTextState();
}

class _ExtendAbleTextState extends State<ExtendAbleText> {
  late String _upperhalf;
  late String _lowerhalf;

  bool _hiddentext = true;

  final _textheight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.likhna.length > _textheight) {
      _upperhalf = widget.likhna.substring(0, _textheight.toInt());
      _lowerhalf = widget.likhna
          .substring(_textheight.toInt() + 1, widget.likhna.length);
    } else {
      _upperhalf = widget.likhna;
      _lowerhalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _lowerhalf.isEmpty
            ? SmallText(text: _upperhalf)
            : Column(
                children: [
                  Container(
                      child: SmallText(
                    height: 1.7,
                    colour: AppColors.paraColor,
                    size: Dimensions.font16,
                    text: _hiddentext
                        ? ("$_upperhalf...")
                        : (_upperhalf + _lowerhalf),
                  )),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _hiddentext = !_hiddentext;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: 'show more',
                          size: Dimensions.font16,
                          colour: AppColors.mainColor,
                        ),
                        Icon(
                          _hiddentext
                              ? Icons.arrow_drop_down_sharp
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  )
                ],
              ));
  }
}
