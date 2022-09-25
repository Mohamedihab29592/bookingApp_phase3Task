import 'package:booking_app/core/utilis/constants/colors.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/routes/routes_manager.dart';
import 'core/utilis/constants/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  di.init();
  runApp(const MotelApp());
}

class MotelApp extends StatelessWidget {
  const MotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<HomeCubit>()..getHomeData()),
        BlocProvider(create: (context) => di.sl<SearchCubit>()),
      ],
      child:  MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          primaryColor: AppColors.kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
