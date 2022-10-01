import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

import '../../widgets/filterSearchWidget.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Explore'.tr(context)),
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.pop(context);
          HomeCubit.get(context).getHomeData();}, icon: Icon(Icons.arrow_back),),

      ),
      body: const FilterWidget(),
    );
  }
}