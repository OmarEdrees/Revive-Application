import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageCubit extends Cubit<bool> {
  // true = English, false = Arabic
  LanguageCubit() : super(false);

  void toggleLanguage(BuildContext context, bool isEnglish) {
    emit(isEnglish);

    if (isEnglish) {
      context.setLocale(const Locale('en'));
    } else {
      context.setLocale(const Locale('ar'));
    }
  }

  void syncWithLocale(BuildContext context) {
    emit(context.locale.languageCode == 'en');
  }
}
