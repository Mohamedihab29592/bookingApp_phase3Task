import 'dart:convert';

import 'package:booking_app/core/local/cache_helper.dart';
import 'package:booking_app/features/home/data/models/hotels_model.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return Row(
              children: [
                IconButton(
                    onPressed: () {
                      cubit.getHomeData();
                    },
                    icon: const Icon(
                      Icons.add,
                    )),
                if (state is GetHomeDataSuccessState)
                  Text(cubit.hotelsEntity!.homeEntity.data[0].name.toString()),

                IconButton(onPressed: ()async{
                  var x =  CacheHelper.getData(key: 'cachedHomeData');
                  // var y = HotelsModel.fromJson(json.decode(x));
                  // print(y.toString());
                }, icon: Icon(Icons.search
                ))
              ],
            );
          },
        ),
        actions: [Text('Hi')],
      ),
    );
  }
}
