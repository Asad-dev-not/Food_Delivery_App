import 'dart:math';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food11/widgets/Bigtext.dart';
import 'package:food11/widgets/appicon.dart';
import 'package:food11/widgets/dimentions.dart';
import 'package:food11/widgets/extendable_text.dart';
import 'package:food11/widgets/icons.dart';

import '../../widgets/BigText2.dart';
import '../../widgets/colors.dart';
import '../../widgets/smalltext.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/biryani.jpg"))),
            )),
        Positioned(
          top: Dimensions.height45,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(micon: Icons.arrow_back_ios),
              AppIcon(micon: Icons.shopping_cart_checkout)
            ],
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularfoodimagesize - 25,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  top: Dimensions.height20,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText2(
                    text: 'Biryani',
                    size: 35,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: Dimensions.icon24,
                                )),
                      ),
                      SizedBox(
                        width: Dimensions.width5,
                      ),
                      SmallText(text: ("4.5")),
                      SizedBox(
                        width: Dimensions.width5,
                      ),
                      SmallText(text: '1287'),
                      SizedBox(
                        width: Dimensions.width5,
                      ),
                      SmallText(text: ('comments'))
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconsClass(
                          icon: Icons.circle_rounded,
                          iconcolor: AppColors.iconColor1,
                          text: 'Normal'),
                      IconsClass(
                          icon: Icons.location_on,
                          iconcolor: AppColors.mainColor,
                          text: '1.7km'),
                      IconsClass(
                          icon: Icons.access_time_rounded,
                          iconcolor: AppColors.iconColor1,
                          text: 'Normal')
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                    // width: Dimensions.width30,
                  ),
                  BigText2(text: 'Introduce'),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExtendAbleText(
                        likhna:
                            'One of the most royal delicacies that you can enjoy on any occasion or festival, Chicken Biryani is the epitome of a one-pot meal. Well, no one can resist the sight of the aromatic and delicious Chicken Biryani recipe. If you are also craving that, then you need not go anywhere as we have got this super-easy biryani recipe for you. So, what are you waiting for? Do try this delicious Chicken Biryani recipe and enjoy it with your loved ones.',
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ]),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            top: Dimensions.height20,
            bottom: Dimensions.height20,
            left: Dimensions.width45,
            right: Dimensions.width45),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2)),
          color: AppColors.buttonBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  top: Dimensions.height20,
                  bottom: Dimensions.height15),
              // height: Dimensions.height30,
              // width: Dimensions.width30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.iconColor1,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  BigText2(
                    text: '0',
                    size: 24,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.iconcolor2,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  top: Dimensions.height20,
                  bottom: Dimensions.height15),
              // height: Dimensions.height30,
              // width: Dimensions.width30,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
                  Container(
                    child: BigText2(
                      text: '\$10 | Add to cart',
                      colour: Colors.white,
                    ),
                    decoration: BoxDecoration(color: AppColors.mainColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
