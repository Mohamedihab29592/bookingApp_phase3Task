import 'package:bloc/bloc.dart';
import 'package:booking_app/core/app_localization/language_cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';



part 'locale_state.dart';

class LocaleCubit extends Cubit<LocalStates> {
  LocaleCubit() : super(InitialState());
static LocaleCubit get(context) => BlocProvider.of(context);
   Locale? locale;
  Future<void> getSaveLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    locale = Locale(cachedLanguageCode);
    emit(ChangeLocaleState());
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    locale = Locale(languageCode);
    emit(ChangeLocaleState());  }



  bool isDarkMode = true;

  void changeAppMode({ bool ? fromShared})async {
    if (fromShared != null) {
      print("if""$isDarkMode");

      isDarkMode = fromShared;
    } else {
      isDarkMode = !isDarkMode;
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool('isDarkMode',  isDarkMode).then((value) {
        print(isDarkMode);
      });
    }
    emit(ChangeAppModeSucces());
  }
}
