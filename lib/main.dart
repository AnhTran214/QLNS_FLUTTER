import 'package:flutter/material.dart';
import 'package:qlns/core/navigation/router.dart';
import 'package:qlns/core/translation/app_translation_delegate.dart';
import 'package:qlns/core/translation/application.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(new MyApp());

//layout app
class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;
  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: Locale('vi'));// đổi vi -> en để đổi ngôn ngữ
    application.onLocaleChanged = onLocaleChange;
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          _newLocaleDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale("en", ""),
          const Locale("vi", ""),
        ],
        theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
            highlightColor: Colors.lightBlueAccent,
            accentColor: Colors.lightBlueAccent),
        title: "This app for android",
        onGenerateRoute: Router.generateRoute);
    // home: new RootPage(auth: new Auth()));
  }
}
