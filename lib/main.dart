import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qlns/ui/views/login.dart';

import 'core/models/authentication.dart';
import 'core/models/rootpage.dart';

void main() => runApp(new MyApp());

//layout app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Xây dựng giao diện
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
            highlightColor: Colors.lightBlueAccent,
            accentColor: Colors.lightBlueAccent),
        title: "This app for android",
        home: new RootPage(auth: new Auth()));
  }
}
