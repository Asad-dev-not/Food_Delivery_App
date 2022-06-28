// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:food11/Screen/Food_main_display.dart';
import 'package:food11/widgets/Bigtext.dart';
import 'package:food11/widgets/dimentions.dart';
import 'package:food11/widgets/smalltext.dart';

class Food1 extends StatefulWidget {
  const Food1({Key? key}) : super(key: key);

  @override
  State<Food1> createState() => _Food1State();
}

class _Food1State extends State<Food1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height45,
                bottom: Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: 'Pakistan'),
                    // ignore: prefer_const_constructors
                    Row(
                      children: [
                        SmallText(
                          text: 'Lahore',
                          colour: const Color(0xFF332d2b),
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: Dimensions.height45,
                      width: Dimensions.height45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: const Color(0xFF89dad0)),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.icon24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: MainFood(),
          ))
        ],
      ),
    );
  }
}
