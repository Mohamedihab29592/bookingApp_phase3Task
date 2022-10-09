import 'package:booking_app/core/component/others.dart';
import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:booking_app/features/search/presentation/screens/hotelSearchView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/component/custom_text.dart';
import '../../../../core/utilis/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class SearchItem extends StatelessWidget {
   const SearchItem({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SearchCubit,SearchState>(
     listener: (context,state){},

      builder: (context,state) {
        var cubit = SearchCubit.get(context);
        if (state is SearchHotelSuccessState) {
          return  ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
                return InkWell(

                radius: 10,
                onTap: (){
                  navigateTo(context: context, widget: HotelSearchView(
                    hotelName:cubit.searchModel!.data.data[index].name,
                    locationName: cubit.searchModel!.data.data[index].address,
                    rate: cubit.searchModel!.data.data[index].rate,
                    price: cubit.searchModel!.data.data[index].price,
                    desc: cubit.searchModel!.data.data[index].description,
                    image: imageBaseUrl+cubit.searchModel!.data.data[index].images[0].image,
                    id: cubit.searchModel!.data.data[index].id,
                    lat: cubit.searchModel!.data.data[index].latitude,
                    long: cubit.searchModel!.data.data[index].longitude,
                    index: index,
                    facilities: cubit.searchModel!.data.data[index].facilities[0].image,));
                },
                child:SizedBox(
                  height: 162,
                  child: Card(
                    clipBehavior: Clip.none,
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
                              image: NetworkImage(imageBaseUrl+ cubit.searchModel!.data.data[index].images[0].image),
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
                                  text: cubit.searchModel!.data.data[index].name,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                ),
                                const SizedBox(height: 5,),
                                CustomText(
                                  text:  cubit.searchModel!.data.data[index].address,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5,),
                                RatingBar.builder(
                                  initialRating:  double.parse(cubit.searchModel!.data.data[index].rate)/2,
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
                                      text: '\$${cubit.searchModel!.data.data[index].price}',
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
                                const SizedBox(height: 5,),
                                SizedBox(
                                  height: 40,
                                  child: ListView.separated(
                                    physics: const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context,index)=>const Text(" / ",),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (BuildContext context, int index) => CustomText(text: cubit.searchModel!.data.data[0].facilities[index].name,fontSize: 14,),
                                    itemCount: cubit.searchModel!.data.data[index].facilities.length,
                                  ),
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
                },
            itemCount: cubit.searchModel!.data.total,
          );
        }
        if (state is SearchHotelLoadingState) {
          return  const Center(child: CircularProgressIndicator(color: AppColors.teal,));
        }
        if (state is SearchDeleteSuccessState)
          {
            return Container();
          }
        else
        {return
          Center(child: Container());}

        }



    );

  }
}


