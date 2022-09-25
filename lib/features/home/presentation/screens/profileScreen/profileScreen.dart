import 'package:booking_app/core/utilis/constants/colors.dart';
import 'package:booking_app/core/utilis/constants/values_manger.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
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
            appBar: AppBar(
              title: IconButton(onPressed: (){
                cubit.getProfileData();
              }, icon: const Icon(Icons.add)),
            ),
            backgroundColor: AppColors.kPrimaryColor,
            body: Padding(
              padding:  const EdgeInsets.all(AppMargin.m20),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                cubit.profileModel!.profileData.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'View and Edit Profile',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: AppColors.darkGrey),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: AppColors.white.withOpacity(.1),
                                offset: const Offset(0, 10),
                              ),
                            ],
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
                  const SizedBox(
                    height: 30,
                  ),
                  BuildProfileItem(
                      text: 'Change Password', icon: Icons.lock, function: () {}),
                  BuildProfileItem(
                      text: 'Invite Friend', icon: Icons.people, function: () {}),
                  BuildProfileItem(
                      text: 'Credit & Coupons',
                      icon: Icons.card_giftcard,
                      function: () {}),
                  BuildProfileItem(
                      text: 'Help Center', icon: Icons.info, function: () {}),
                  BuildProfileItem(
                      text: 'Payment', icon: Icons.payment, function: () {}),
                  BuildProfileItem(
                      text: 'Settings', icon: Icons.settings, function: () {}),
                ],
              ),
            ),
          );
      },
    );
  }
}