import 'package:booking_app/core/utilis/constants/values_manger.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppPadding.p28),
                  topLeft: Radius.circular(AppPadding.p28)),
              boxShadow: [
                BoxShadow(spreadRadius: 1, blurRadius: 3),
              ],
            ),
            child: CurvedNavigationBar(
              height: 50,
              color: Theme.of(context).bottomAppBarColor,
              backgroundColor: Colors.black87,
              index: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: cubit.bottomItems,
            ),
          ),

        );
      }

    );
  }
}
