import 'package:booking_app/core/component/my_button.dart';
import 'package:booking_app/features/search/domain/entity/search_entity.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:booking_app/features/search/presentation/widgets/accommodation.dart';
import 'package:booking_app/features/search/presentation/widgets/distance.dart';
import 'package:booking_app/features/search/presentation/widgets/popluarFilter.dart';
import 'package:booking_app/features/search/presentation/widgets/rangeSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FilterPageNew extends StatefulWidget {
  const FilterPageNew({super.key, required this.searchText});

  final String searchText;

  @override
  State<FilterPageNew> createState() => _FilterPageNewState();
}

class _FilterPageNewState extends State<FilterPageNew> {
  final minPrice = TextEditingController();
  final maxPrice = TextEditingController();

  @override
  void initState() {
    final cubit = SearchCubit.get(context);
    cubit.getFacilities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 68,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Text(
              'Filter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: BlocConsumer<SearchCubit, SearchState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        RangeSliderWidget(
                          minPriceController: minPrice,
                          maxPriceController: maxPrice,
                        ),
                        // const DividerWidget(),
                        const SizedBox(height: 10),
                        SearchCubit.get(context).facilitiesModel != null
                            ? const PopularFilterWidget()
                            : const Center(child: CircularProgressIndicator()),
                        // const DividerWidget(),
                        const SizedBox(height: 10),
                        const DistanceWidget(),
                        //  const DividerWidget(),
                        const SizedBox(height: 10),
                        //  const DividerWidget(),
                        const SizedBox(height: 10),
                        const TypeAccommodationWidget(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          // const DividerWidget(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyButton(
              label: "Apply",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              width: double.infinity,
              onPressed: () {
                SearchCubit.get(context).searchForHotel(
                    userSearchEntity: UserSearchEntity(
                  address: "",
                  maxPrice: maxPrice.text,
                  minPrice: minPrice.text,
                  latitude: " ",
                  longitude: " ",
                  distance: " ",
                  name: widget.searchText,

                ));
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

