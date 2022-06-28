import 'dart:ffi';
import 'dart:ui';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food11/widgets/BigText2.dart';
import 'package:food11/widgets/Bigtext.dart';
import 'package:food11/widgets/colors.dart';
import 'package:food11/widgets/dimentions.dart';
import 'package:food11/widgets/icons.dart';
import 'package:food11/widgets/smalltext.dart';

class MainFood extends StatefulWidget {
  const MainFood({Key? key}) : super(key: key);

  @override
  State<MainFood> createState() => _MainFoodState();
}

class _MainFoodState extends State<MainFood> {
  PageController _pageController = PageController(viewportFraction: 0.88);
  var _currentPageValue = 0.0;
  final double _scalefactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, position) {
              return buildPageItem(position);
            },
            itemCount: 5,
          ),
        ),
        //dots
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        //popular text
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BigText2(
              //   text: 'Popular',
              // ),
              // SizedBox(
              //   width: Dimensions.width20,
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 1),
              //   child: BigText(
              //     text: '.',
              //     colour: Colors.black26,
              //   ),
              // ),
              // SizedBox(
              //   width: Dimensions.width20,
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 1),
              //   child: SmallText(text: 'Food Pairing'),
              // ),
              // list of food and images
              Expanded(
                child: SizedBox(
                  height: 900,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                              bottom: Dimensions.height10),
                          child: Row(
                            children: [
                              // image selection
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    // color: Colors.blue,
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/snadwich.jpg"))),
                              ),
                              // image detail
                              Expanded(
                                child: Container(
                                  height: 120,
                                  // color: Colors.white,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              Dimensions.radius20),
                                          bottomRight: Radius.circular(
                                              Dimensions.radius20))),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.width10),
                                    child: Column(children: [
                                      SizedBox(
                                        height: Dimensions.height15,
                                      ),
                                      BigText2(
                                          text: 'Pakistani Sandwich Majedaar'),
                                      SizedBox(
                                        height: Dimensions.height15,
                                      ),
                                      Row(
                                        children: [
                                          Wrap(
                                            children: List.generate(
                                                5,
                                                (index) => Icon(
                                                      Icons.star,
                                                      color:
                                                          AppColors.mainColor,
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
                                        height: Dimensions.height15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                      )
                                    ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      })),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var _currScale = 1 - (_currentPageValue - index) * (1 - _scalefactor);
      var _currTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var _currScale =
          _scalefactor + (_currentPageValue - index + 1) * (1 - _scalefactor);
      var _currTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var _currScale = 1 - (_currentPageValue - index) * (1 - _scalefactor);
      var _currTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    } else {
      var _currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(1, _height * (1 - _scalefactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF9294cc),
                image: const DecorationImage(
                    image: AssetImage("assets/images/staek.jpg"),
                    fit: BoxFit.fill)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(color: Colors.white, offset: Offset(0, -5)),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width15,
                  right: Dimensions.width15,
                  top: Dimensions.height15,
                  // bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText2(
                      text: 'Juicy Meat Maringate',
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
