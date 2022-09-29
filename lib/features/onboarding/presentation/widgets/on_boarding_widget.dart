import 'package:booking_app/core/component/custom_button.dart';
import 'package:booking_app/core/component/custom_text.dart';
import 'package:booking_app/core/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'build_on_boarding_item.dart';
import 'on_board_model.dart';

class OnBoardingWidget extends StatefulWidget {
  OnBoardingWidget({Key? key}) : super(key: key);

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {


  PageController pageController = PageController();

  List<OnBoardModel> model = [
    OnBoardModel(
      image: 'assets/images/empty.png',
      title: 'Plan your trips',
      body:'book one of your unique hotel to escape the ordinary',
    ),
    OnBoardModel(
      image: 'assets/images/empty.png',
      title: 'Find best deals',
      body:'Find deals for any season from cosy country homes to city flats',
    ),
    OnBoardModel(
      image: 'assets/images/empty.png',
      title: 'Best travelling all time',
      body:'Find deals for any season from cosy country homes to city flats',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => BuildOnBoardingItem(
                model: model[index],
              ),
              itemCount: model.length,
              onPageChanged: (int index) {
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: model.length,
            effect: const SlideEffect(
              spacing: 5.0,
              radius: 5.0,
              dotWidth: 7.0,
              dotHeight: 7.0,
              paintStyle: PaintingStyle.stroke,
              strokeWidth: .6,
              dotColor: AppColors.grey,
              activeDotColor: AppColors.teal,
            ),
            onDotClicked: (index) {

            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(onPressed: (){},backgroundColor: AppColors.teal,minWidth: double.infinity, child: const CustomText(text: 'Login',color: AppColors.white,),),
          const SizedBox(
            height: 10,
          ),
          CustomButton(onPressed: (){},backgroundColor: AppColors.darkGrey,minWidth: double.infinity ,child: const CustomText(text: 'Create account',color: AppColors.white,),),
        ],
      ),
    );
  }
}
