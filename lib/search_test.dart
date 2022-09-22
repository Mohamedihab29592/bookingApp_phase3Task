import 'package:booking_app/features/search/domain/entity/search_entity.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTest extends StatelessWidget {
  SearchTest({Key? key}) : super(key: key);
  String? address;
  String? maxPrice;
  String? minPrice;
  String? facilities0;
  String? facilities1;
  String? latitude;
  String? longitude;
  String? distance;
  String? name = '5000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocConsumer<SearchCubit, SearchState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            var cubit = SearchCubit.get(context);
            return IconButton(
                onPressed: () {
                  /// here logic if the String is equal null it will be empty
                  cubit.searchForHotel(
                    userSearchEntity: UserSearchEntity(
                      address: address ?? '',
                      maxPrice: maxPrice ?? '',
                      minPrice: minPrice ?? '',
                      facilities0: facilities0 ?? '',
                      facilities1: facilities1 ?? '',
                      latitude: latitude ?? '',
                      longitude: longitude ?? '',
                      distance: distance ?? '',
                      name: name!,
                    ),
                  );
                },
                icon: const Icon(Icons.add));
          },
        ),
      ),
    );
  }
}
