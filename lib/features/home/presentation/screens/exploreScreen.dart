import 'package:booking_app/core/utilis/constants/app_strings.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilis/constants/assets_manager.dart';
import '../../../../core/utilis/constants/colors.dart';
import '../../../../core/utilis/constants/values_manger.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  //var token = CacheHelper.getData(key: 'token');

  @override
  void initState() {
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener:(context, state){},
      builder:(context, state)=> Scaffold(
          backgroundColor: AppColors.kPrimaryColor,
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    leadingWidth: 50,
                    pinned: true,
                    leading: IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                        backgroundColor: AppColors.white74,
                        child: Icon(
                          Icons.arrow_back,
                          size: AppSize.s20,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: const CircleAvatar(
                          backgroundColor: AppColors.black,
                          child: Icon(
                            Icons.favorite_border,
                            size: AppSize.s20,
                            color: AppColors.teal,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                    systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarColor: AppColors.transparent,
                        statusBarIconBrightness: Brightness.dark),
                    expandedHeight: AppSize.s706,
                    collapsedHeight: AppSize.s70,
                    actionsIconTheme: const IconThemeData(opacity: AppSize.s0),
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Image.asset(
                              ImageAssets.hotel,
                              fit: BoxFit.cover,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Container(
                              width: 145,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(AppPadding.p100),
                                color: AppColors.cardColors,
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  const [
                                    Text(
                                      AppStrings.moreDetails,
                                      style: TextStyle(
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.zero,
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 30,
                            (context, index) => ListTile(
                          leading: Text(index.toString()),
                          title: Text("text"),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Center(
                child: Text("Sample text"),
              ),
            ),
          )),
    );
  }
}