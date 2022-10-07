import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/app_localization/cubit/locale_cubit.dart';
import 'package:booking_app/core/component/toast.dart';
import 'package:booking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:booking_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:booking_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bloc_observer.dart';
import 'core/routes/routes_manager.dart';
import 'core/utilis/constants/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/utilis/constants/themes.dart';
import 'injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  bool result = await InternetConnectionChecker().hasConnection;
  if (result == true) {
  } else {
    showToast(text: "No internet Connection ", state: ToastStates.error);
  }

  final sharedPreferences = await SharedPreferences.getInstance();
  bool? isDarkMode = sharedPreferences.getBool("isDarkMode") ?? false;

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  di.init();
  runApp(MotelApp(
    isDarkMode: isDarkMode,
  ));
}

class MotelApp extends StatelessWidget {
  final bool isDarkMode;

  Locale? locale;

  MotelApp({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di.sl<HomeCubit>()
              ..getCurrentPosition()
              ..getHomeData()
              ..getProfileData()),
        BlocProvider(create: (context) => di.sl<SearchCubit>()),
        BlocProvider(
            create: (context) => LocaleCubit()
              ..getSaveLanguage()
              ..changeAppMode(
                fromShared: isDarkMode,
              )),
      ],
      child: BlocConsumer<LocaleCubit, LocalStates>(
        listener: (context, state) {
          if (state is ChangeLocaleState) {
            //locale = state.locale;
          }
        },
        builder: (context, state) {
          return MaterialApp(
            themeMode: LocaleCubit.get(context).isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            darkTheme: AppThemes.darkMode,
            theme: AppThemes.lightMode,
            locale: LocaleCubit.get(context).locale,
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }

              return supportedLocales.first;
            },
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashRoute,
            onGenerateRoute: RouteGenerator.getRoute,
          );
        },
      ),
    );
  }
}
