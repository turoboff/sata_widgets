library my_localization;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../localstore.dart';
import 'models/localization_model.dart';

late LocalizationDelegate _delegate;

typedef SwLocalizationBuilder = Widget Function(
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    LocalizationDelegate delegate);

class SwLocalization {
  Future<void> initalize({required List<String> supportedLocales}) async {
    if (supportedLocales.isEmpty) {
      throw Exception("supportedLocales should not be empty");
    }
    _delegate = await LocalizationDelegate.create(
      fallbackLocale: supportedLocales.first,
      supportedLocales: supportedLocales,
    );

    Locale locale;
    Map<String, dynamic>? storedLang =
        await SwLocalstore.get(LangModel.storeCollection);
    if (storedLang != null) {
      LangModel lang = LangModel.fromMap(storedLang);
      locale = Locale(lang.lang);
    } else {
      locale = Locale(supportedLocales.first);
    }
    await _delegate.changeLocale(locale);
  }

  static LocalizedApp localizedApp(Widget app) => LocalizedApp(_delegate, app);

  static LocalizationProvider provider(BuildContext context,
      {required SwLocalizationBuilder materialAppBuilder}) {
    WidgetsBinding.instance;
    final LocalizationDelegate localizationDelegate =
        LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: materialAppBuilder(
        [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        localizationDelegate,
      ),
    );
  }

  static LocalizationDelegate delegate = _delegate;
}

String tr(String key) => translate(key);
