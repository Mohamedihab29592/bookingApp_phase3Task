import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../../core/component/custom_text.dart';
import '../../../../../../../core/utilis/constants/colors.dart';



class BuildCanceledItem extends StatelessWidget {
  final String urlImage;
  final String startDate;
  final String endDate;
  final int roomsNumber;
  final int peopleNumber;
  final String hotelName;
  final String city;
  final String location;
  final String price;
  final double initialRating;

  const BuildCanceledItem({
    Key? key,
    required this.urlImage,
    required this.startDate,
    required this.endDate,
    required this.roomsNumber,
    required this.peopleNumber,
    required this.hotelName,
    required this.city,
    required this.location,
    required this.price,
    required this.initialRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,),
      child: SizedBox(
        height: 160,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 130,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(urlImage),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: hotelName,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                      ),
                      const SizedBox(height: 5,),
                      CustomText(
                        text: city,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5,),
                      CustomText(
                        text: '$startDate - $endDate',
                        fontSize: 14,
                      ),
                      const SizedBox(height: 5,),
                      CustomText(
                        text: '$roomsNumber Room $peopleNumber People',
                        fontSize: 14,

                      ),

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
                      Row(
                        children: [
                          CustomText(
                            text: '\$$price',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const CustomText(
                            text: '/per night',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}