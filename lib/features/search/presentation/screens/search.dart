import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/component/my_text.dart';
import 'package:booking_app/features/search/domain/entity/search_entity.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilis/constants/app_strings.dart';
import '../../../../core/utilis/constants/colors.dart';
import '../../../../core/utilis/constants/values_manger.dart';
import '../../../../core/component/my_text_form_field.dart';
import '../widgets/circuleAvatarImages.dart';
import '../widgets/searchItem.dart';

class Search extends StatefulWidget {
 const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        splashRadius: 15,

                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close,color: AppColors.teal,),
                      ),
                     const Spacer(),
                      IconButton(
                        splashRadius: 15,
                        onPressed: () {
                        },
                        icon: const Icon(Icons.location_on_outlined,color: AppColors.teal,),
                      ),
                      IconButton(
                        splashRadius: 15,

                        onPressed: () {
                        },
                        icon: const Icon(Icons.filter_alt,color: AppColors.teal,),
                      ),


                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,right: 15,left: 18,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         MyText(
                          text: AppStrings.search.tr(context),
                          fontSize: AppSize.s22,
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Container(
                          height: AppSize.s50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s30),
                          ),
                          child: MyTextForm(
                            isDense: true,
                            controller: _controller,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.searchHint.tr(context);
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: IconButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus!.unfocus();

                                  cubit.searchForHotel(
                                    userSearchEntity: UserSearchEntity(
                                      name: _controller.text,
                                      address: '',
                                      maxPrice: '',
                                      minPrice: '',
                                      latitude: '',
                                      longitude: '',
                                      distance: '',
                                    ),
                                  );

                              },
                              icon: const Icon(
                                Icons.search,
                                color: AppColors.teal,
                              ),
                            ),
                            hintText: AppStrings.whereAreYouGoing.tr(context),
                            radius: AppSize.s30,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        SizedBox(
                          height: 105,
                          child: CircleAvatarItems(),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Row(
                          children: [
                             const MyText(
                                text: AppStrings.searchResult,
                                fontSize: AppSize.s16),
                            const Spacer(),
                            TextButton(
                              onPressed: () {

                              },
                              child: MyText(
                                text: AppStrings.clear.tr(context),
                                fontSize: AppSize.s16,
                                colors: AppColors.teal,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: SearchItem(),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
