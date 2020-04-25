

import 'package:flutter/material.dart';
import 'package:qlns/core/navigation/router.dart';


void main() => runApp(new MyApp());

//layout app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
            highlightColor: Colors.lightBlueAccent,
            accentColor: Colors.lightBlueAccent),
        title: "This app for android",
        onGenerateRoute: Router.generateRoute);
       // home: new RootPage(auth: new Auth()));
  }
}
