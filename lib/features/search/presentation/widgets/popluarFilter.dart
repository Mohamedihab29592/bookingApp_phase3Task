
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilis/constants/colors.dart';

class PopularFilterWidget extends StatefulWidget {
  const PopularFilterWidget({Key? key}) : super(key: key);
  @override
  State<PopularFilterWidget> createState() => _PopularFilterWidgetState();
}

class _PopularFilterWidgetState extends State<PopularFilterWidget> {
  late List<bool> selectedComponents;
  List<String> selectedFacilities = [];
  @override
  void initState() {
    selectedComponents =
        List.filled(SearchCubit.get(context).facilitiesModel!.data!.length, false);
    selectedFacilities =
        List.filled(SearchCubit.get(context).facilitiesModel!.data!.length, '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is GetFacilitiesSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular filter',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    letterSpacing: 0.5,

                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                filterComponent(),
              ],
            ),
          );
        }
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  filterComponent() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount:SearchCubit.get(context).facilitiesModel!.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: AppColors.teal,

              side: BorderSide(
                width: 2,

              ),
              value: selectedComponents[index],
              onChanged: (bool? value) {
                setState(
                      () {
                    selectedComponents[index] = value!;
                    if (value == true) {
                      selectedFacilities[index] =
                          SearchCubit.get(context).facilitiesModel!.data![index].id.toString();
                    } else {
                      selectedFacilities[index] = '';
                    }
                    SearchCubit.get(context)
                        .selectedFacilities;
                  },
                );
              },
            ),
            Text(
              SearchCubit.get(context).facilitiesModel!.data![index].name,
            ),
          ],
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        childAspectRatio: 5,
      ),
    );
  }
}