import 'package:flutter/material.dart';

import '../../../../../../../core/component/custom_text.dart';
import '../../../../../../../core/utilis/constants/colors.dart';


class BuildUpcomingItem extends StatelessWidget {
  final String urlImage;
  final String startDate;
  final String endDate;
  final int roomsNumber;
  final int peopleNumber;
  final bool isFavorite;
  final String hotelName;
  final String city;
  final String day;
  final String location;
  final int price;
  final double initialRating;

  const BuildUpcomingItem(
      {Key? key,
      required this.urlImage,
      required this.startDate,
      required this.endDate,
      required this.roomsNumber,
      required this.peopleNumber,
      required this.isFavorite,
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
        const SizedBox(height: 50,),
        Row(
          children: [
            const Spacer(),
            CustomText(
              text:
                  '$startDate - $endDate, $roomsNumber Room $peopleNumber People',
              fontSize: 14,
              color: AppColors.white,
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 5,),
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
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkGrey,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        isFavorite?Icons.favorite:Icons.favorite_outline_sharp,
                        color: AppColors.teal,
                        size: 20,
                      ),),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children:[
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
                         CustomText(
                          text: '$day, $city ',
                          fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.grey,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Row(
                            children:  [
                              const Icon(Icons.location_on,color: AppColors.teal,size: 20,),
                              Expanded(
                                child:  CustomText(
                                  text: location,
                                  fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.grey,
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
                        // RatingBar.builder(
                        //   initialRating: initialRating,
                        //   minRating: 0,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 5,
                        //   itemBuilder: (context, _) => const Icon(
                        //     Icons.star,
                        //     color: AppColors.teal,
                        //   ),
                        //   onRatingUpdate: (rating) {
                        //   },
                        //   itemSize: 20,
                        // ),
                         const Expanded(
                          child:  CustomText(
                            text: '  80 Reviewers',
                            fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.grey,
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
    );
  }
}
