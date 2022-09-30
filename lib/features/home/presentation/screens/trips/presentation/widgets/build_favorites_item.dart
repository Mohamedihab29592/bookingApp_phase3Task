import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../../core/component/custom_text.dart';
import '../../../../../../../core/utilis/constants/colors.dart';




class BuildCanceledItem extends StatelessWidget {
  final String urlImage;
  final String hotelName;
  final String city;
  final String day;
  final String location;
  final String price;
  final double initialRating;

  const BuildCanceledItem(
      {Key? key,
      required this.urlImage,
      required this.hotelName,
      required this.city,
      required this.day,
      required this.location,
      required this.price,
      required this.initialRating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 140,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light ?  AppColors.white:AppColors.darkGrey,

            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(20),

          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 110,height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(urlImage),
                  ),
                ),
              ),
              const SizedBox(width: 4,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7,),
                    CustomText(
                      text: hotelName,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4,),
                    CustomText(
                      text: '$day, $city',
                      fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.grey,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children:  [
                        const Icon(Icons.location_on,color: AppColors.teal,size: 16,),
                        CustomText(
                          text: location,
                          fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.grey,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 50,),
                        CustomText(
                          text: '\$$price',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4,),
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
                          onRatingUpdate: (rating) {
                          },
                          itemSize: 20,
                        ),
                        const SizedBox(width: 80,),
                        const CustomText(
                          text: '/per night',
                          fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.grey,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
    );
  }
}
