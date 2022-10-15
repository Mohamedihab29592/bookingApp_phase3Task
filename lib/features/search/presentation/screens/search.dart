import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/component/my_text.dart';
import 'package:booking_app/core/component/others.dart';
import 'package:booking_app/features/search/domain/entity/search_entity.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilis/constants/app_strings.dart';
import '../../../../core/utilis/constants/colors.dart';
import '../../../../core/utilis/constants/values_manger.dart';
import '../../../../core/component/my_text_form_field.dart';
import '../widgets/circuleAvatarImages.dart';
import '../widgets/searchItem.dart';
import 'filterPage.dart';
import 'hotelsOnGoogle.dart';

class Search extends StatefulWidget {
 const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                title:   Row(
                  children: [
                    const Spacer(),
                    if(cubit.searchModel!=null && cubit.searchModel!.data.data.isNotEmpty)
                      IconButton(
                        splashRadius: 15,
                        onPressed: () {
                          navigateTo(context: context, widget: HotelsOnMapPage(hotelsMap:cubit.searchModel!.data.data));

                        },
                        icon:  const Icon(Icons.location_on_outlined,
                            color:AppColors.teal),
                      ),

                    if(cubit.searchModel==null||cubit.searchModel!.data.data.isEmpty)
                      IconButton(
                        splashRadius: 15,
                        onPressed: () {},
                        icon:  const Icon(Icons.location_off,
                            color:AppColors.grey),
                      ),
                    IconButton(
                      splashRadius: 15,

                      onPressed: () {
                        navigateTo(context: context, widget: const FilterPageNew());
                      },
                      icon: const Icon(Icons.filter_alt,color: AppColors.teal,),
                    ),


                  ],
                ),

              ),

            SliverPersistentHeader(
              pinned: false,
                floating: true,
                delegate: SliverAppBarDelegate(
              minHeight: 115,
              maxHeight: 55,
              child:  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,right: 15,left: 18,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: AppStrings.search.tr(context),
                          fontSize: AppSize.s22,
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),

                        MyTextForm(
                          controller: _controller,
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.searchHint.tr(context);
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: IconButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus!.unfocus();

                              cubit.searchForHotel(
                                userSearchEntity: UserSearchEntity(
                                  name: _controller.text,
                                  address: '',
                                  maxPrice: '',
                                  minPrice: '',
                                  latitude: '',
                                  longitude: '',
                                  distance: '',
                                  facilities: {
                                    ...SearchCubit.get(context).selectedFacilities.asMap().map(
                                          (key, value) => MapEntry(
                                        'facilities[$key]',
                                        value,
                                      ),
                                    ),
                                  },
                                ),
                              );

                            },
                            icon: const Icon(
                              Icons.search,
                              color: AppColors.teal,
                            ),
                          ),
                          hintText: AppStrings.whereAreYouGoing.tr(context),
                          radius: AppSize.s30,

                        ),

                      ],
                    ),
                  ),
                ],
              ),



            
            )),
              SliverList(

                  delegate: SliverChildListDelegate(

                [
                  Column(
                    children: [


                      Padding(
                        padding: const EdgeInsets.only(right: 15,left: 18,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (cubit.searchModel != null&&cubit.searchModel!.data.data.isNotEmpty)
                              Text(
                                "${cubit.searchModel!.data.total.toString()} Hotel Found",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            if (cubit.searchModel == null || cubit.searchModel!.data.data.isEmpty)
                               Container(),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 105,
                              child: CircleAvatarItems(),
                            ),

                            Row(
                              children: [
                                const MyText(
                                    text: AppStrings.searchRecent,
                                    fontSize: AppSize.s16),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    cubit.clearList();

                                  },
                                  child: MyText(
                                    text: AppStrings.clear.tr(context),
                                    fontSize: AppSize.s16,
                                    colors: AppColors.teal,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: double.infinity,
                              child: SearchItem(),
                            ),
                          ],),
                      )

                    ],
                  ),
                ]


              )),
            ]
          ),
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
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      child: child,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}