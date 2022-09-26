import 'package:booking_app/core/utilis/constants/colors.dart';
import 'package:booking_app/core/utilis/constants/values_manger.dart';
import 'package:booking_app/features/auth/widgets/my_text.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/utilis/constants/assets_manager.dart';

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
        if(state is GetHomeDataSuccessState){
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: AppSize.s22,
            ),
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cubit.hotelsEntity!.homeEntity.data.length,
            itemBuilder: (context, index) {
              var _item = cubit.hotelsEntity!.homeEntity.data[index];
              return SizedBox(
                height: AppSize.s130,
                width: double.infinity,
                child: Card(
                  color: AppColors.darkGrey,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if(_item.images.isEmpty )
                      Image(
                        image:  const AssetImage(ImageAssets.hotel),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 3,
                        height: double.infinity,
                      )
                      else
                      Image(
                        image:  const AssetImage(ImageAssets.resort),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 3,
                        height: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 7, right: 3, bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: _item.name,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                            MyText(
                              text: _item.address,
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
                                const MyText(
                                    text: "2.0 Km to City",
                                    fontSize: 14,
                                    colors: AppColors.grey),
                                const SizedBox(
                                  width: 60,
                                ),
                                MyText(
                                  text: "\$${_item.price}",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                              RatingBar.builder(
                                itemSize: 18,
                              initialRating: double.parse(_item.rate)/2,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,

                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: AppColors.teal,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                                // MyText(
                                //     text: "Rate : ${item.rate}",
                                //     fontSize: 14,
                                //     colors: AppColors.teal),
                                const SizedBox(
                                  width: AppSize.s50,
                                ),
                                MyText(
                                  text: "/per night",
                                  fontSize: 16,
                                  colors: Colors.grey.shade800,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }else{
          return const Center(child: CircularProgressIndicator());
        }

      },
    );
  }
}
