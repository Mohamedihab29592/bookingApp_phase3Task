import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/component/custom_button.dart';
import 'package:booking_app/core/component/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utilis/constants/colors.dart';
import '../../../../../core/utilis/constants/app_strings.dart';
import '../../widgets/cancelled_widget.dart';
import '../../widgets/completed_widget.dart';
import '../../widgets/upcoming_widget.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  final List<Widget> screens = [
    const UpcomingWidget(),
    const CompletedWidget(),
    const CanceledWidget(),
  ];

  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CustomText(
                text: AppStrings.myTrip.tr(context),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(

                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).brightness == Brightness.light ?  AppColors.white:AppColors.darkGrey),
                clipBehavior: Clip.antiAliasWithSaveLayer,

                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = 0;
                          });
                        },
                        child: CustomText(
                          text: AppStrings.upcoming.tr(context),
                          fontSize: 16,
                          fontWeight: currentScreen == 0
                              ? FontWeight.w800
                              : FontWeight.bold,
                          color: currentScreen == 0
                              ? AppColors.teal
                              : AppColors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = 1;
                          });
                        },
                        child: CustomText(
                          text: AppStrings.completed.tr(context),
                          fontSize: 16,
                          fontWeight: currentScreen == 1
                              ? FontWeight.w800
                              : FontWeight.bold,
                          color: currentScreen == 1
                              ? AppColors.teal
                              : AppColors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = 2;
                          });
                        },
                        child: CustomText(
                          text: AppStrings.cancelled.tr(context),
                          fontSize: 16,
                          fontWeight: currentScreen == 2
                              ? FontWeight.w800
                              : FontWeight.bold,
                          color: currentScreen == 2
                              ? AppColors.teal
                              : AppColors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              screens[currentScreen],
            ],
          ),
        ),
      ),
    );
  }
}
