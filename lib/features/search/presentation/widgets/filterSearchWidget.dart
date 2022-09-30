import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/utilis/constants/assets_manager.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import '../../../../core/network/end_points.dart';
import '../../../../core/utilis/constants/colors.dart';
import '../../domain/entity/search_entity.dart';
import 'filterItem.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  ScrollController scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

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
    var cubit = SearchCubit.get(context);
    return BlocConsumer<SearchCubit, SearchState>(
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
                            child: Text(
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
                        onTap: () {
                          cubit.searchForHotel(
                            userSearchEntity: UserSearchEntity(
                              name: '',
                              address: '',
                              maxPrice: '',
                              minPrice: '',
                              latitude: '',
                              longitude: '',
                              distance: '',
                            ),
                          );
                        },
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
                            color: AppColors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (cubit.searchModel != null)
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
                  child: Text(
                    "${cubit.searchModel!.data.total.toString()} total",
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
                   if(SearchCubit.get(context).searchModel != null)
                  ListView.separated(
                    controller: scrollController,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: SearchFilterItem(
                        urlImage: imageBaseUrl+
                            cubit.searchModel!.data.data[index].images[0].image,
                        hotelName:  cubit.searchModel!.data.data[index].name,
                        location:  cubit.searchModel!.data.data[index].address,
                        price:  cubit.searchModel!.data.data[index].price,
                        initialRating: double.parse(cubit.searchModel!.data.data[index].rate)/2,
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: cubit.searchModel!.data.data.length
                  ),

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
