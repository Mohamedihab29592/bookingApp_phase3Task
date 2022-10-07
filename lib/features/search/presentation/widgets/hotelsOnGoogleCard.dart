
import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/features/search/data/models/search_model.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilis/constants/colors.dart';


class HotelsOnGoogleMapCardWidget extends StatefulWidget {
  HotelsOnGoogleMapCardWidget({Key? key, required this.searchHotels})
      : super(key: key);
  List<DataHotelModel> searchHotels;
  @override
  State<HotelsOnGoogleMapCardWidget> createState() =>
      _HotelsOnGoogleMapCardWidgetState();
}

class _HotelsOnGoogleMapCardWidgetState
    extends State<HotelsOnGoogleMapCardWidget> {
  @override
  Widget build(BuildContext context) {
    final hotelsList = widget.searchHotels;
    return BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is SearchHotelErrorState) {

          }
        }, builder: (context, state) {
      return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final hotel = hotelsList[index];
            return Container(
              width: MediaQuery.of(context).size.width * 0.85,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:AppColors.darkGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                         imageBaseUrl + hotel.images[0 ].image),

                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(hotel.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,color: AppColors.white)),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(hotel.address,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(

                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,color: AppColors.white)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.location_on,color: AppColors.teal,

                                        size: 20,
                                      ),
                                      Text('2.0km to city',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,color: AppColors.white)),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('\$${hotel.price}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,color: AppColors.white)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,

                                        size: 18,color: AppColors.teal
                                      ),
                                      Text(
                                        double.parse(hotel.rate).toStringAsFixed(1),
                                        style: const TextStyle(

                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    '/per night',
                                    style: TextStyle(

                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,color: AppColors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 5,
          ),
          itemCount: hotelsList.length);
    });
  }
}