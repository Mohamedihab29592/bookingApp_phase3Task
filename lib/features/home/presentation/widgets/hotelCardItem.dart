import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/component/others.dart';
import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/core/utilis/constants/colors.dart';
import 'package:booking_app/core/utilis/constants/values_manger.dart';
import 'package:booking_app/core/component/my_text.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:booking_app/features/home/presentation/screens/exploreScreen/hotelView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/utilis/constants/app_strings.dart';

class CardOfHotel extends StatelessWidget {
  const CardOfHotel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = HomeCubit.get(context);
        if (state is GetHomeDataLoadingState) {
          return const Center(child: CupertinoActivityIndicator(color: AppColors.teal,));
        }
        if (state is GetHomeDataErrorState) {
          return const Center(
              child: Text(
            "no Data",
          ));
        } else if (state is GetHomeDataSuccessState) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: AppSize.s22,
            ),
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cubit.hotelsEntity!.homeEntity.data.length,
            itemBuilder: (context, index) {
              var item = cubit.hotelsEntity!.homeEntity.data[index];
              return InkWell(
                onTap: () {
                  navigateTo(
                      context: context,
                      widget: HotelView(
                        index:index,
                        hotelName: item.name,
                        locationName: item.address,
                        rate: item.rate,
                        price: item.price,
                        image: imageBaseUrl + item.images[0].image,
                        id: item.id,
                        lat: item.latitude,
                        long: item.longitude,
                        desc: item.description,
                      ));
                },
                child: SizedBox(
                  height: AppSize.s145,
                  width: double.infinity,
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: NetworkImage(
                              imageBaseUrl + item.images[0].image),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 3,
                          height: double.infinity,
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 7, right: 7, bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: MyText(
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    text: item.name,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                MyText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  text: item.address,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  colors: AppColors.grey,
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: AppColors.teal,
                                      size: 11,
                                    ),
                                     MyText(
                                        text: AppStrings.kmToCity.tr(context),
                                        fontSize: 14,
                                        colors: AppColors.grey),
                                    const Spacer(),
                                    MyText(
                                      text: "\$${item.price}",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 18,
                                      initialRating:
                                          double.parse(item.rate) / 2,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: AppColors.teal,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    // MyText(
                                    //     text: "Rate : ${item.rate}",
                                    //     fontSize: 14,
                                    //     colors: AppColors.teal),
                                    const Spacer(),
                                    MyText(
                                      text: "/per night".tr(context),
                                      fontSize: 16,
                                      colors: Colors.grey.shade500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: (CupertinoActivityIndicator(color: AppColors.teal,)));
        }
      },
    );
  }
}
