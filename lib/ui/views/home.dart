import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qlns/core/models/authentication.dart';
import 'package:qlns/ui/constants/colors.dart';
import 'package:flutter/services.dart';

List<String> _timekeepingList = [
  'Chấm công',
  'Dữ liệu\nchấm công\ncá nhân',
  'Dữ liệu\nthất bại',
  'Chốt công\nhằng ngày',
  'Bảng chấm công\ncá nhân',
];
List<String> _leaveRegisterList = [
  'Nghỉ phép',
  'Đi trễ\nvề sớm',
  'Bù công',
  'Đi trễ/về sớm\nthai sản'
];

List<String> _businessList = [
  'Đăng ký\ncông tác ngoài',
  'Dữ liệu\ncông tác',
];
List<String> _kpiList = ['Thông tin\nphụ cấp'];

class Home extends StatefulWidget {
  Home({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeViewState(); // return a state's object. Where is the state's class ?
  }
}

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
String _email = "";

class _HomeViewState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    print("Email:");
    print(_email);
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return  Stack(
        children: <Widget>[
          Image.asset('images/butterfly.png', fit: BoxFit.cover),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text('Chấm công',
                  style: TextStyle(fontSize: 15.0, color: Colors.white)),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 0.0, right: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: signOut,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.blue,
                            Colors.blueAccent,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Image.asset(
                          'images/logo2-3.png',
                          width: 200,
                          height: 100,
                        ),
                      )),
                  ListTile(
                    title: Text('Thông tin cá nhân'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Đổi mật khẩu'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            body: Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 120.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    color: color_header,
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(right: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset('images/yuki_hana.png',
                                  fit: BoxFit.cover, width: 100, height: 100),
                            )),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Trần Hoàng Nam Anh",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: color_white_text1)),
                              FutureBuilder(
                                future: getUser(),
                                builder: (context, data) {
                                  if (data.connectionState ==
                                      ConnectionState.waiting)
                                    return Container();
                                  else
                                    return Text('Email: ' + _email,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: color_white_text1));
                                },
                              ),
                              Text("MSNV:123456",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: color_white_text1)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 4,
                      initialIndex: 0,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                                color: color_header,
                                child: TabBar(
                                  isScrollable: true,
                                  indicatorColor: Colors.white,
                                  labelColor: Colors.white,
                                  labelStyle: TextStyle(fontSize: 11.0),
                                  tabs: <Widget>[
                                    Tab(
                                        icon: Icon(Icons.check_box),
                                        text: "Chấm công"),
                                    Tab(
                                        icon: Icon(Icons.accessible),
                                        text: "Đăng ký phép"),
                                    Tab(
                                        icon: Icon(Icons.business_center),
                                        text: "Công tác ngoài"),
                                    Tab(icon: Icon(Icons.add_box), text: "KPI")
                                  ],
                                )),
                            Expanded(
                              child: Container(
                                child: TabBarView(
                                  children: <Widget>[
                                    _itemTabBarView(_timekeepingList),
                                    _itemTabBarView(_leaveRegisterList),
                                    _itemTabBarView(_businessList),
                                    _itemTabBarView(_kpiList),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
  }

  Widget _itemTabBarView(List<String> items) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: items.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return _itemDashboard(items[index], index);
      },
    );
  }

  Widget _itemDashboard(String name, int index) {
    return GestureDetector(
        onTap: () {
          if (name == "Nghỉ phép") {
            Navigator.of(context).pushNamed("sabbaticalLeave");
          }
          if (name == "Chấm công") {
            Navigator.of(context).pushNamed("timekeeping");
          }
          if (name == "Dữ liệu\nchấm công\ncá nhân") {
            Navigator.of(context).pushNamed("monthlyWorksheet");
          }
          if (name == "Dữ liệu\nthất bại") {
            Navigator.of(context).pushNamed("dataFailed");
          }
          if (name == "Chốt công\nhằng ngày") {
            Navigator.of(context).pushNamed("completeTheTimekeeping");
          }
          if (name == "Bảng chấm công\ncá nhân") {
            Navigator.of(context).pushNamed("personalTimeSheets");
          }
          if (name == "Đi trễ\nvề sớm") {
            Navigator.of(context).pushNamed("arriveLateAndComeHomeEarly");
          }
          if (name == "Bù công") {
            Navigator.of(context).pushNamed("timekeepingCompensation");
          }
          if (name == "Đi trễ/về sớm\nthai sản") {
            Navigator.of(context).pushNamed("maternity");
          }
          if (name == "Đăng ký\ncông tác ngoài") {
            Navigator.of(context).pushNamed("externalWork");
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20.0,
                spreadRadius: 0.0,
                offset: Offset(0.5, 0.5),
              )
            ],
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.blueAccent,
          ),
          margin: EdgeInsets.all(7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: getIcon(name),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  name,
                  style: TextStyle(color: color_white_text1, fontSize: 13.0),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }

  getUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    // final String userId = user.uid.toString();
    _email = user.email.toString();
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      Fluttertoast.showToast(
          msg: "Đăng xuất thành công",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.white70,
          textColor: Colors.black,
          fontSize: 16.0);
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  Icon getIcon(String name) {
    switch (name) {
      case 'Chấm công':
        return new Icon(Icons.add, color: color_white_icons, size: 40.0);
      case 'Bảng công\ntháng':
        return new Icon(Icons.assignment, color: color_white_icons, size: 40.0);
      case 'Dữ liệu\nthất bại':
        return new Icon(Icons.cancel, color: color_white_icons, size: 40.0);
      case 'Chốt công\nhằng ngày':
        return new Icon(Icons.check_box, color: color_white_icons, size: 40.0);
      case 'Bảng chấm công\ncá nhân':
        return new Icon(Icons.perm_contact_calendar,
            color: color_white_icons, size: 40.0);
      case 'Nghỉ phép':
        return new Icon(Icons.accessible, color: color_white_icons, size: 40.0);
      case 'Đi trễ\nvề sớm':
        return new Icon(Icons.compare_arrows,
            color: color_white_icons, size: 40.0);
      case 'Bù công':
        return new Icon(Icons.add_box, color: color_white_icons, size: 40.0);
      case 'Đi trễ/về sớm\nthai sản':
        return new Icon(Icons.child_friendly,
            color: color_white_icons, size: 40.0);
      case 'Đăng ký\ncông tác ngoài':
        return new Icon(Icons.business_center,
            color: color_white_icons, size: 40.0);
      case 'Dữ liệu\ncông tác':
        return new Icon(Icons.assignment, color: color_white_icons, size: 40.0);
      case 'Thông tin\nphụ cấp':
        return new Icon(Icons.info, color: color_white_icons, size: 40.0);
      default:
        return new Icon(Icons.add_box, color: color_white_icons, size: 40.0);
    }
  }
}
