import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlns/ui/constants/colors.dart';
import 'dart:ui';

class Maternity extends StatefulWidget {
  @override
  _Maternity createState() => _Maternity();
}

class _Maternity extends State<Maternity> {
  bool information = true;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: color_header,
            highlightColor: color_header,
            accentColor: color_header),
        title: "Maternity",
        home: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: color_header,
            title: Center(
              child: Text(
                "Đăng ký đi trễ về sớm - thai sản ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color_white_text1),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: color_white_text1),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: FlatButton(
                  color: color_header,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  splashColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: color_header)),
                  onPressed: () {
                    Navigator.of(context).pushNamed("maternityRegistration");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add_circle),
                      Text("Nhập đăng ký đi trễ về sớm - thai sản")
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 2.5, bottom: 10.0),
                child: FlatButton(
                  color: color_header,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.only(
                      left: 100.0, right: 100.0, top: 10.0, bottom: 10.0),
                  splashColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: color_header)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Icon(Icons.exit_to_app), Text("Export")],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            labelText: 'Tìm kiếm',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Nhập tìm kiếm của bạn...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: color_white_icons))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Table(
                  /*columnWidths: {
                    0: FixedColumnWidth(40.0),
                    1: FixedColumnWidth(120.0),
                    4: FixedColumnWidth(40.0),
                  },*/
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                        decoration: BoxDecoration(color: color_header),
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                            child: Center(
                                child: Text(
                              "STT",
                              style: TextStyle(
                                  color: color_white_text1,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                            child: Center(
                              child: Text(
                                "Nhân viên",
                                style: TextStyle(
                                    color: color_white_text1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                            child: Center(
                              child: Text(
                                "Thông tin đơn",
                                style: TextStyle(
                                    color: color_white_text1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                            child: Center(
                              child: Text(
                                "Thông tin kết quả xử lý",
                                style: TextStyle(
                                    color: color_white_text1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                            child: Center(
                                child: Text(
                              "Ngày bắt đầu",
                              style: TextStyle(
                                  color: color_white_text1,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ]),
                    TableRow(children: [
                      Container(
                        child: Column(
                          children: <Widget>[Text("")],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text(""),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text(""),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text(""),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[Text("")],
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }

  Icon icon() {
    if (information == true) {
      return new Icon(Icons.add_box);
    }
    return Icon(Icons.indeterminate_check_box);
  }
}
