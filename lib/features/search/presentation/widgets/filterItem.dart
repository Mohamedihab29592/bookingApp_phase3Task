import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/component/custom_text.dart';
import '../../../../core/utilis/constants/colors.dart';

class SearchFilterItem extends StatelessWidget {
  final String urlImage;
  final int? id;
  final String hotelName;
  final String location;
  final String price;
  final double initialRating;
  const SearchFilterItem({Key? key, required this.urlImage, this.id, required this.hotelName,  required this.location, required this.price, required this.initialRating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.darkGrey,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.darkGrey,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.network(urlImage),

                        ],
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomText(
                                    text: hotelName,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    color: AppColors.white,
                                  ),
                                ),
                                CustomText(
                                  text: "\$$price",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                            Row(
                              children: [

                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: AppColors.teal,
                                        size: 20,
                                      ),
                                      Expanded(
                                        child: CustomText(
                                          text: location,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const CustomText(
                                  text: "/per night",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: initialRating,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: AppColors.teal,
                                  ),
                                  onRatingUpdate: (rating) {},
                                  itemSize: 20,
                                ),
                                const Expanded(
                                  child: CustomText(
                                    text: '  80 Reviewers',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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

              ],
            ),
          ),
        ],
      ),
    );
  }
}
