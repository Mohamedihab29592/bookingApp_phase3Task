import 'dart:async';

import 'package:booking_app/features/onBoardingScreen/widgets/pageContent.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utilis/constants/colors.dart';

class PageViewSection extends StatefulWidget {
  const PageViewSection({super.key});

  @override
  State<PageViewSection> createState() => _PageViewSectionState();
}

class _PageViewSectionState extends State<PageViewSection> {
  final PageController _pageController = PageController();
  late final Timer _timer;
  int _activeIndex = 0;

  final List<PageContent> _pages = const [
    PageContent(
      image: 'assets/images/onboarding_1.png',
      title: 'Plan your trips',
      description: 'Book one of your unique hotel to escape the ordinary',
    ),
    PageContent(
      image: 'assets/images/onboarding_2.png',
      title: 'Find best deals',
      description:
          'Find deals of any season from cosy country homes to city flats',
    ),
    PageContent(
      image: 'assets/images/onboarding_3.png',
      title: 'Best traveling all time',
      description:
          'Find deals of any season from cosy country homes to city flats',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer timer) {
        if (_activeIndex < _pages.length - 1) {
          _activeIndex++;
          _pageController.animateToPage(
            _activeIndex,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          );
        } else {
          _activeIndex = 0;
          _pageController.animateToPage(
            _activeIndex,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) => setState(() {
              _activeIndex = value;
            }),
            physics: const BouncingScrollPhysics(),
            children: _pages,
          ),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: _pages.length,
          effect: const WormEffect(
            activeDotColor: AppColors.teal,
            dotColor: AppColors.grey,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 4.0,
          ),
        ),

      ],
    );
  }
}
