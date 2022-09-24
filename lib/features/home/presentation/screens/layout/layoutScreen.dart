import 'package:booking_app/core/utilis/constants/app_strings.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilis/constants/colors.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {


    return BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state)
        {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(

            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Scaffold(
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: AppColors.darkGrey,
                selectedItemColor: AppColors.teal,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: AppColors.grey,
                currentIndex: cubit.currentIndex,
                onTap: (index) => setState(() => cubit.currentIndex = index),
                items:  const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: AppStrings.explore,
                 //   backgroundColor: AppColors.backGroundColorOfNaviBar,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: AppStrings.trips,
                 //   backgroundColor: AppColors.backGroundColorOfNaviBar,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_sharp),
                    label: AppStrings.profile,
                   // backgroundColor: AppColors.backGroundColorOfNaviBar,
                  ),
                ],
              ),
            ),

          );
        }

    );
  }
}