import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/core/utilis/constants/colors.dart';
import 'package:booking_app/core/utilis/constants/values_manger.dart';
import 'package:booking_app/features/auth/widgets/my_text.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              var item = cubit.hotelsEntity!.homeEntity.data[index];
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
                      Image(
                        image: (item.images.isNotEmpty) ? NetworkImage('$imageBaseUrl${item.images[0].image}') : const NetworkImage('https://www.ahstatic.com/photos/1276_ho_00_p_1024x768.jpg'),
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
                              text: item.name,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                            MyText(
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
                                const MyText(
                                    text: "2.0 Km to City",
                                    fontSize: 14,
                                    colors: AppColors.grey),
                                const SizedBox(
                                  width: 20,
                                ),
                                MyText(
                                  text: "\$${item.price}",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                MyText(
                                    text: "Rate : ${item.rate}",
                                    fontSize: 14,
                                    colors: AppColors.teal),
                                const SizedBox(
                                  width: 25,
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
