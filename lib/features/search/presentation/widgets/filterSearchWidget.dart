import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/component/others.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/component/my_text_form_field.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/utilis/constants/app_strings.dart';
import '../../../../core/utilis/constants/colors.dart';
import '../../../home/presentation/screens/trips/presentation/screens/view_hotel_details.dart';
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
    SearchCubit.get(context).getFacilities();

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

        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyTextForm(
                        enableBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.grey)),
                        isDense: true,
                        radius: 40,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.nameHint.tr(context);
                          }
                          return null;
                        },
                        textInputType: TextInputType.name,
                        controller: _searchController,
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        cubit.searchForHotel2(
                          userSearchEntity: UserSearchEntity(
                            name: _searchController.text,
                            address: '',
                            maxPrice: '',
                            minPrice: '',
                            latitude: '',
                            longitude: '',
                            distance: '',
                          ),
                        );
                        _searchController.clear();
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
                const SizedBox(height: 10),
                if (cubit.searchModel != null)
                  Text(
                    "${cubit.searchModel!.data.total.toString()} Hotel Found",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                if (cubit.searchModel == null)
                  const Text(
                    "0 Hotel Found",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  trailing: const Icon(
                    Icons.filter_alt,
                    color: AppColors.teal,
                  ),
                  tilePadding: const EdgeInsets.only(left: 0),
                  iconColor: Colors.grey,
                  collapsedIconColor: Colors.grey,
                  collapsedBackgroundColor: Colors.transparent,
                  title: Text(
                    'Popular Filter'.tr(context),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  children: [
                    if (SearchCubit.get(context).facilitiesModel != null)
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          runSpacing: 4,
                          children: [
                            ...SearchCubit.get(context)
                                .facilitiesModel!
                                .data!
                                .asMap()
                                .map(
                                  (key, value) => MapEntry(
                                    key,
                                    InkWell(
                                        onTap: () {
                                          SearchCubit.get(context)
                                              .selectFacility(value.id);
                                        },
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 25.0,
                                              height: 25.0,
                                              decoration: BoxDecoration(
                                                color: SearchCubit.get(context)
                                                        .selectedFacilities
                                                        .any((element) =>
                                                            element == value.id)
                                                    ? Colors.teal
                                                    : Colors.grey[600],
                                                border: Border.all(
                                                  color: AppColors.grey,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: SearchCubit.get(context)
                                                      .selectedFacilities
                                                      .any((element) =>
                                                          element == value.id)
                                                  ? const Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 18.0,
                                                    )
                                                  : Container(),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              value.name,
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        )),
                                  ),
                                )
                                .values
                                .toList(),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    if(cubit.searchModel!=null)
                      ListView.separated(
                          controller: scrollController,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),

                          itemBuilder: (context, index) =>  InkWell(
                                onTap: () {
                                  navigateTo(
                                      context: context,
                                      widget: ViewHotelDetails(
                                        lat:cubit.searchModel!.data.data[index].latitude ,
                                        long: cubit.searchModel!.data.data[index].longitude,
                                        id: cubit.searchModel!.data.data[index].id,
                                        name: cubit
                                            .searchModel!.data.data[index].name,
                                        location: cubit.searchModel!.data
                                            .data[index].address,
                                        price: cubit.searchModel!.data
                                            .data[index].price,
                                        image: imageBaseUrl +
                                            cubit.searchModel!.data.data[index]
                                                .images[0].image,
                                      ));
                                },
                                child: SearchFilterItem(
                                  urlImage: imageBaseUrl +
                                      cubit.searchModel!.data.data[index]
                                          .images[0].image,
                                  hotelName:
                                      cubit.searchModel!.data.data[index].name,
                                  location: cubit
                                      .searchModel!.data.data[index].address,
                                  price:
                                      cubit.searchModel!.data.data[index].price,
                                  initialRating: double.parse(cubit
                                          .searchModel!.data.data[index].rate) /
                                      2,
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          itemCount: cubit.searchModel!.data.data.length),
                    if(state is SearchHotelLoadingState)
                      const Center(
                        child: CupertinoActivityIndicator(
                          color: AppColors.teal,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   SliverAppBarDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });
//
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;
//
//   @override
//   double get minExtent => minHeight;
//
//   @override
//   double get maxExtent => math.max(maxHeight, minHeight);
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final progress = shrinkOffset / maxExtent;
//
//     // debugPrint('progress => $progress');
//
//     return AnimatedContainer(
//       duration: const Duration(seconds: 2),
//       // height: progress,
//       child: child,
//     );
//   }
//
//   @override
//   bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }
