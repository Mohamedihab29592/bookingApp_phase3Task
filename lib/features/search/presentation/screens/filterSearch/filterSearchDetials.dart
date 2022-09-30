import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/component/my_text_form_field.dart';
import 'package:booking_app/features/search/domain/entity/search_entity.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utilis/constants/colors.dart';

class FilterSearchDetails extends StatefulWidget {
  const FilterSearchDetails({Key? key}) : super(key: key);

  @override
  State<FilterSearchDetails> createState() => _FilterSearchDetailsState();
}

class _FilterSearchDetailsState extends State<FilterSearchDetails> {
  @override
  void initState() {
    SearchCubit.get(context).getFacilities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ExpansionTile(
                    iconColor: Colors.grey,
                    collapsedIconColor: Colors.grey,
                    collapsedBackgroundColor: Colors.transparent,
                    title: Text(
                      'Choose your facility'.tr(context),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    children: [
                      if (SearchCubit.get(context).facilitiesModel != null)
                        Wrap(
                          runSpacing: 16.0,
                          spacing: 16.0,
                          children: [
                            ...SearchCubit.get(context)
                                .facilitiesModel!
                                .data!
                                .asMap()
                                .map(
                                  (key, value) => MapEntry(
                                    key,
                                    InkWell(
                                      onTap: () {
                                        SearchCubit.get(context)
                                            .selectFacility(value.id);
                                      },
                                      borderRadius:
                                          BorderRadius.circular(10.0),
                                      child: Container(
                                        width: 80.0,
                                        height: 80.0,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: SearchCubit.get(context)
                                                  .selectedFacilities
                                                  .any((element) =>
                                                      element == value.id)
                                              ? Colors.teal
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child:
                                                  Image.network(value.image),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              value.name,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: SearchCubit.get(context).searchController,
                    decoration: InputDecoration(
                      labelText: 'Search'.tr(context),
                      labelStyle: const TextStyle(color: Colors.grey),
                      isDense: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, )
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, )
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, )
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, )
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, )
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, )
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    minWidth: double.infinity,
                    height: 50.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      SearchCubit.get(context).searchForHotel2(
                          userSearchEntity: const UserSearchEntity(
                        address: '',
                        maxPrice: '',
                        minPrice: '',
                        latitude: '',
                        longitude: '',
                        distance: '',
                        name: '',
                      ));
                    },
                    child: Text(
                      'Search'.tr(context),
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20.0),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
