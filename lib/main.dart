import 'package:flutter/material.dart';
import 'package:food11/Screen/Food_Screen1.dart';
import 'package:food11/pages/food/popular_food.dart';
import 'package:food11/pages/food/recommended_food_details.dart';
import 'package:get/get.dart';
import 'dart:ffi';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecommendedFoodDetails(),
    );
  }
}
