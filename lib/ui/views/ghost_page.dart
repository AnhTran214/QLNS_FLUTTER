import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlns/core/models/authentication.dart';
import 'package:qlns/core/models/rootpage.dart';

class GhostPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GhostPage();
}

class _GhostPage extends State<GhostPage> {
  Widget build(BuildContext context) {
    return Scaffold(body: new RootPage(auth: new Auth()));
  }
}
