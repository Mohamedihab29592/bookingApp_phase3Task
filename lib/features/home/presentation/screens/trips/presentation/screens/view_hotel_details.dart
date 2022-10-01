import 'package:booking_app/core/component/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/component/others.dart';

import '../../../../../../search/presentation/cubit/search_cubit.dart';
import '../../../../../../search/presentation/screens/filterSearch/mapScreen.dart';
import '../widgets/build_book_cancel_item.dart';

class ViewHotelDetails extends StatelessWidget {
  final String name;
  final String location;
  final String price;
  final String image;
  final String lat;
  final String long;
  final int id;

  const ViewHotelDetails({Key? key, required this.name, required this.location, required this.price, required this.image, required this.id, required this.lat, required this.long}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
      {
            return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title:  CustomText(
                text: name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context: context, widget: MapScreen(lat: lat, long: long,));
                  },
                  icon: const Icon(
                    Icons.map_outlined,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => BuildBooKingOrCancelItem(
                roomName: 'Deluxe Room',
                image:image,
                id: id,

                price: price,
                people: 2,
                children: 2,
              ),
              itemCount: 1,
              physics: const BouncingScrollPhysics(),
            ),
          );
          }
        });
  }
}
