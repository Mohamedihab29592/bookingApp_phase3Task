import 'package:booking_app/core/component/custom_text.dart';
import 'package:booking_app/features/home/presentation/screens/profileScreen/build_setting_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilis/constants/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Setting',
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: AppColors.white,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children:  [
                  const SizedBox(
                    height: 30,
                  ),
                  const BuildSettingItem(
                      widget: Icon(
                        Icons.notifications,
                        color: AppColors.white,
                        size: 25,
                      ),
                      label: 'Notifications'),
                  const BuildSettingItem(
                      widget: Icon(
                        Icons.dark_mode,
                        color: AppColors.white,
                        size: 25,
                      ),
                      label: 'Theme Mode'),
                  const BuildSettingItem(
                      widget: Icon(
                        Icons.font_download_outlined,
                        color: AppColors.white,
                        size: 25,
                      ),
                      label: 'Fonts'),
                  const BuildSettingItem(
                      widget: Icon(
                        Icons.color_lens,
                        color: AppColors.white,
                        size: 25,
                      ),
                      label: 'Color'),
                  const BuildSettingItem(
                      widget: Icon(
                        Icons.language,
                        color: AppColors.white,
                        size: 25,
                      ),
                      label: 'Language'),
                  const BuildSettingItem(
                      widget: CustomText(
                        text: 'Egypt',
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: AppColors.grey,
                      ),
                      label: 'Country'),
                  const BuildSettingItem(
                      widget: CustomText(
                        text: '\$ AUD',
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: AppColors.grey,
                      ),
                      label: 'Currency'),
                  const BuildSettingItem(
                      widget: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.white,
                        size: 25,
                      ),
                      label: 'Terms of Services'),
                  const BuildSettingItem(
                      widget: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.white,
                        size: 25,
                      ),
                      label: 'Privacy Policy'),
                  const BuildSettingItem(
                      widget: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.white,
                        size: 25,
                      ),
                      label: 'Give Us Feedbacks'),
                  BuildSettingItem(
                      widget: IconButton(onPressed: (){}, icon: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.white,
                        size: 25,
                      ),),
                      label: 'Log out'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
