import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/routes/routes_manager.dart';
import 'core/utilis/constants/app_strings.dart';
import 'features/search/presentation/cubit/search_cubit.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  di.init();
  runApp(const MotelApp());
}

class MotelApp extends StatelessWidget {
  const MotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<HomeCubit>()),
        BlocProvider(create: (context) => di.sl<SearchCubit>()),
      ],
      child: const MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
