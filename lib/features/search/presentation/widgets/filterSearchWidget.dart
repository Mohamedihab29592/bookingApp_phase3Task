import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/utilis/constants/assets_manager.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import '../../../../core/utilis/constants/colors.dart';



class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // AppBloc.get(context).getHotels(
    //   isForce: true,
    // );

    // scrollController.addListener(() {
    //   if(scrollController.position.extentAfter == 0 && !AppBloc.get(context).isEnd &&
    //       AppBloc.get(context).lastPage >= AppBloc.get(context).currentPage)
    //   {
    //     debugPrint('maxScrollExtent');
    //     AppBloc.get(context).toggleIsEnd();
    //     AppBloc.get(context).getHotels();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // if (state is ErrorState) {}
      },
      builder: (context, state) {
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPersistentHeader(
              pinned: false,
              delegate: SliverAppBarDelegate(
                minHeight: 55.0,
                maxHeight: 55.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child:  Text(
                              'Search'.tr(context),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.all(14.0),
                          child: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: SliverAppBarDelegate(
                minHeight: 30.0,
                maxHeight: 30.0,
                child: Container(
                  color: AppColors.kPrimaryColor,
                  height: 30.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child:  Text(
                    '7' + 'Hotel'.tr(context),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                //  if(AppBloc.get(context).hotels.isNotEmpty)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                                           color: AppColors.darkGrey,

                            borderRadius: BorderRadius.circular(10),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey,
                            //     blurRadius: 5,
                            //     offset: const Offset(0, 1),
                            //   ),
                            // ],
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 200,
                                child: Stack(
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          ImageAssets.guestHouse),
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Expanded(
                                          child: Text(
                                            'Hotel Name',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '200\$',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.amber,
                                          size: 24,
                                        ),
                                        Text(
                                          "10.5",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemCount:7,
                    ),
                  // if(AppBloc.get(context).hotels.isEmpty)
                  //   const CupertinoActivityIndicator(),
                  //if(AppBloc.get(context).isEnd)
                  //   const Padding(
                  //     padding: EdgeInsets.only(
                  //       top: 14.0,
                  //       bottom: 100.0,
                  //     ),
                  //     child: CupertinoActivityIndicator(),
                  //   ),
                ],
              ),
            ),
          ],
        );

      },
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    // debugPrint('progress => $progress');

    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      // height: progress,
      child: child,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}