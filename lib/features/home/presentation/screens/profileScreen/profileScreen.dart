import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/component/others.dart';
import 'package:booking_app/core/utilis/constants/colors.dart';
import 'package:booking_app/core/utilis/constants/values_manger.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:booking_app/features/home/presentation/screens/profileScreen/setting_screen.dart';
import 'package:booking_app/features/home/presentation/widgets/build_profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_profile_screen.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
            body: Padding(
              padding:  const EdgeInsets.all(20 ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen()));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    cubit.profileModel!.profileData.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                   Text(
                                    'View and Edit Profile'.tr(context),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: AppColors.darkGrey),

                              image:  DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    cubit.profileModel!.profileData.image,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 10,
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    BuildProfileItem(
                        text: 'Change Password'.tr(context), icon: Icons.lock, function: () {}),
                    const SizedBox(
                      height: 30,
                    ),
                    BuildProfileItem(
                        text: 'Invite Friend'.tr(context), icon: Icons.people, function: () {}),
                    const SizedBox(
                      height: 30,
                    ),
                    BuildProfileItem(
                        text: 'Credit & Coupons'.tr(context),
                        icon: Icons.card_giftcard,
                        function: () {}),
                    const SizedBox(
                      height: 30,
                    ),
                    BuildProfileItem(
                        text: 'Help Center'.tr(context), icon: Icons.info, function: () {}),
                    const SizedBox(
                      height: 30,
                    ),
                    BuildProfileItem(
                        text: 'Payment'.tr(context), icon: Icons.payment, function: () {}),
                    const SizedBox(
                      height: 30,
                    ),
                    BuildProfileItem(
                        text: 'Settings'.tr(context), icon: Icons.settings, function: () {
                          navigateTo(context: context, widget: const SettingScreen());
                    }),
                  ],
                ),
              ),
            ),
          );
      },
    );
  }
}