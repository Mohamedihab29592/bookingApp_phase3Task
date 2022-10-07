import 'package:booking_app/core/component/others.dart';
import 'package:booking_app/core/component/toast.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/component/custom_text.dart';
import '../../../../../core/utilis/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/layout/layoutScreen.dart';


class BuildBooKingOrCancelItem extends StatelessWidget {
  final String roomName;
  final String image;
  final String price;
  final int people;
  final int children;
  final int id;

  const BuildBooKingOrCancelItem(
      {Key? key,
      required this.roomName,
      required this.image,
      required this.price,
      required this.people,
      required this.children, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){
        if (state is BookingHotelSuccessState) {
          showToast(
              text: '${state.message} Check your Trips ',
              state: ToastStates.success);
        }
      },
      builder: (context,state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Stack(
                children: [
                  PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        Image.network(image, fit: BoxFit.cover),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: roomName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: AppColors.teal,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: TextButton(
                          onPressed: ()async {
                          await  HomeCubit.get(context).bookAHotel(hotelId:id.toString() );
                          SearchCubit.get(context).searchModel!.data.data.clear();
                            navigateTo(context: context, widget: const HomeLayout());

                          },
                          child:  const CustomText(
                            text: 'Book now',
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children:  [
                      CustomText(
                        text: '\$$price',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                      const CustomText(
                        text: '/per night',
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: 'sleeps $people People + $children children',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          color: AppColors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: const [
                            CustomText(
                              text: 'More Details',
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
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
