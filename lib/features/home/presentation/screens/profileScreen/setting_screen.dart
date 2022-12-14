import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/app_localization/cubit/locale_cubit.dart';
import 'package:booking_app/core/component/custom_text.dart';
import 'package:booking_app/features/home/presentation/widgets/build_setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utilis/constants/colors.dart';
import '../../cubit/home_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  CustomText(
          text: 'Settings'.tr(context),
          fontWeight: FontWeight.w900,
          fontSize: 25,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                children: [
                  BuildSettingItem(
                      onTap: () {},
                      widget: const Icon(
                        Icons.notifications,
                        size: 20,
                      ),
                      label: 'Notifications'.tr(context)),
                  BlocConsumer<LocaleCubit,LocalStates>(
                      listener: (context,state){
                        if (state is ChangeAppModeSucces)
                          {
                            state = InitialState();
                          }
                      },
                      builder: (context,state){
                        return BuildSettingItem(
                            onTap: () {
                              LocaleCubit.get(context).changeAppMode();
                            },
                            widget: const Icon(
                              Icons.dark_mode,
                              size: 20,
                            ),
                            label: 'Theme Mode'.tr(context));
                      },

      ),
                  BuildSettingItem(
                      onTap: () {},
                      widget: const Icon(
                        Icons.font_download_outlined,
                        size: 20,
                      ),
                      label: 'Fonts'.tr(context)),
                  BuildSettingItem(
                      onTap: () {},
                      widget: const Icon(
                        Icons.color_lens,
                        size: 20,
                      ),
                      label: 'Color'.tr(context)),
                  BlocConsumer<LocaleCubit, LocalStates>(
                    listener: (context, state){
                      // Navigator.pop(context);
                    },
                    builder: (context, state) {
                      return BuildSettingItem(
                            onTap: () {
                              var cubit = LocaleCubit.get(context);

                                if(cubit.locale!.languageCode == 'en') {
                                  context.read<LocaleCubit>().changeLanguage('ar');
                                }else{
                                  context.read<LocaleCubit>().changeLanguage('en');

                              }
                            },
                            widget: const Icon(

                              Icons.language,
                              size: 20,
                            ),
                            label: 'Language'.tr(context));





                    },
                  ),
                  BuildSettingItem(
                      onTap: () {},
                      widget: CustomText(
                        text: 'Egypt'.tr(context),
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: AppColors.grey,
                      ),
                      label: 'Country'.tr(context)),
                  BuildSettingItem(
                      onTap: () {},
                      widget: const CustomText(
                        text: '\$ LE',
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: AppColors.grey,
                      ),
                      label: 'Currency'.tr(context),),
                  BuildSettingItem(
                      onTap: () {},
                      widget: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                      label: 'Terms of Services'.tr(context)),
                  BuildSettingItem(
                      onTap: () {},
                      widget: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                      label: 'Privacy Policy'.tr(context)),
                  BuildSettingItem(
                      onTap: () {},
                      widget: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                      label: 'Give Us Feedbacks'.tr(context),),
                  BuildSettingItem(
                      onTap: () {
                        HomeCubit.get(context).signOut(context);
                      },
                      widget: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                      label: 'Log out'.tr(context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
