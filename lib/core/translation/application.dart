import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Application{
static final Application _application = Application._internal();

factory Application(){
return _application;
}
Application._internal();

final List<String> supportedLanguages = [
"English",
  "VietNam",
];
final List<String> supportedLanguagesCodes = [
"en",
  "vi"
];
//returns the list of supported Locales
Iterable<Locale> supportedLocales()=>
supportedLanguagesCodes.map<Locale>((language)=> Locale(language,""));

  LocaleChangeCallback onLocaleChanged;
}

Application application = Application();
typedef void LocaleChangeCallback(Locale locale);