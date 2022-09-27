import 'package:booking_app/core/component/custom_text.dart';
import 'package:booking_app/features/home/presentation/screens/profileScreen/build_setting_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilis/constants/colors.dart';
import '../../cubit/home_cubit.dart';

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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Setting',
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: AppColors.white,
              ),
              Column(
                children:  [

                   BuildSettingItem(
                       onTap: (){},
                      widget: const Icon(
                        Icons.notifications,
                        color: AppColors.white,
                        size: 20,
                      ),
                      label: 'Notifications'),
                   BuildSettingItem(
                       onTap: (){},
                      widget: const Icon(
                        Icons.dark_mode,
                        color: AppColors.white,
                        size: 20,
                      ),
                      label: 'Theme Mode'),
                   BuildSettingItem(
                       onTap: (){},
                      widget: const Icon(
                        Icons.font_download_outlined,
                        color: AppColors.white,
                        size: 20,
                      ),
                      label: 'Fonts'),
                   BuildSettingItem(
                       onTap: (){},
                      widget: const Icon(
                        Icons.color_lens,
                        color: AppColors.white,
                        size: 20,
                      ),
                      label: 'Color'),
                   BuildSettingItem(
                       onTap: (){},
                      widget: const Icon(

                        Icons.language,
                        color: AppColors.white,
                        size: 20,
                      ),
                      label: 'Language'),
                   BuildSettingItem(
                       onTap: (){},
                      widget: const CustomText(
                        text: 'Egypt',
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: AppColors.grey,
                      ),
                      label: 'Country'),
                   BuildSettingItem(
                       onTap: (){},
                      widget: const CustomText(
                        text: '\$ AUD',
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: AppColors.grey,
                      ),
                      label: 'Currency'),
                   BuildSettingItem(
                       onTap: (){},
                      widget: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.white,
                        size: 20,
                      ),
                      label: 'Terms of Services'),
                   BuildSettingItem(
                       onTap: (){},
                      widget: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.white,
                        size: 20,
                      ),
                      label: 'Privacy Policy'),
                   BuildSettingItem(
                      onTap: (){},
                      widget: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.white,
                        size: 20,
                      ),
                      label: 'Give Us Feedbacks'),
                  BuildSettingItem(
                    onTap: (){
                      HomeCubit.get(context).signOut(context);
                    },
                      widget:const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.white,
                        size: 20,
                      ),
                      label: 'Log out'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
