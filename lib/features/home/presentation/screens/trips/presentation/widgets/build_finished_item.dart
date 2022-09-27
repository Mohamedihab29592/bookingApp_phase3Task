import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../../core/component/custom_text.dart';
import '../../../../../../../core/utilis/constants/colors.dart';



class BuildFinishedItem extends StatelessWidget {
  final String urlImage;
  final String startDate;
  final String endDate;
  final int roomsNumber;
  final int peopleNumber;
  final String hotelName;
  final String city;
  final String day;
  final String location;
  final String price;
  final double initialRating;

  const BuildFinishedItem({
    Key? key,
    required this.urlImage,
    required this.startDate,
    required this.endDate,
    required this.roomsNumber,
    required this.peopleNumber,
    required this.hotelName,
    required this.city,
    required this.day,
    required this.location,
    required this.price,
    required this.initialRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: hotelName,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                color: AppColors.white,

              ),
              CustomText(
                text: '$day, $city',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              CustomText(
                text: '$startDate - $endDate',
                fontSize: 14,
                color: AppColors.white,
              ),
              CustomText(
                text: '$roomsNumber Room $peopleNumber People',
                fontSize: 14,
                color: AppColors.white,

              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.teal,
                    size: 16,
                  ),
                  CustomText(
                    text: location,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
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
                    color: AppColors.white,
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
        ],
      ),
    );
  }
}
