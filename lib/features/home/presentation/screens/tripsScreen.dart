import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TripsScreen extends StatefulWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state)=>Scaffold(
          body:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("trips")],
            ),
          ),
        ),
        );
  }
}
