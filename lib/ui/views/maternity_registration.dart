import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:qlns/ui/constants/colors.dart';

class MaternityRegistration extends StatefulWidget {
  MaternityRegistration({Key key}) : super(key: key);
  @override
  _MaternityRegistration createState() => _MaternityRegistration();
}

class _MaternityRegistration extends State<MaternityRegistration> {
  String dropdownValue = 'Nghỉ phép \n(phép năm/không lương/khác)';
  String dropdownValue1 = 'GSOT0001(Quản trị GSOT)';
  var startOff = DateTime.now();
  var endOff = DateTime.now();

  Widget _startTimeOff() {
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.date_range, color: color_header),
          FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: color_header)),
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2018, 1, 1),
                    maxTime: DateTime(2030, 1, 1), onChanged: (date) {
                  print('change $date');
                  setState(() {
                    startOff = date;
                  });
                }, onConfirm: (date) {
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.vi);
              },
              child: Container(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(startOff.toString()),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }

  Widget _endTimeOff() {
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.date_range, color: color_header),
          FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: color_header)),
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2018, 1, 1),
                    maxTime: DateTime(2030, 1, 1), onChanged: (date) {
                  print('change $date');
                  setState(() {
                    endOff = date;
                  });
                }, onConfirm: (date) {
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.vi);
              },
              child: Container(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(endOff.toString()),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: color_header,
              highlightColor: color_header,
              accentColor: color_header),
          title: "Xin phep",
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: color_header,
              title: Center(
                child: Text(
                  "Nhập mới đăng ký đi trễ về sớm - thai sản",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color_white_text1,
                      fontSize: 16.0),
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
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Nhân viên",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("123456(Tran Hoang Nam Anh)"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Ngày bắt đầu*",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        child: _startTimeOff(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Ngày kết thúc*",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        child: _endTimeOff(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          child: Text(
                        "Số phút đi trễ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(child: Text("60")),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          child: Text(
                        "Số phút về sớm",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(child: Text("60")),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: Center(
                    child: Text(
                      "Thời gian bắt đầu đăng ký trùng với thời gian kết thúc đăng ký. Đề ghị đăng ký thời gian hợp lệ.",
                      style: TextStyle(color: error_color),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Lý do*",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                          padding: EdgeInsets.only(right:10.0, top: 5.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '',
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                        child: FlatButton(
                          color: color_header,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.only(
                              left: 120.0,
                              right: 120.0,
                              top: 15.0,
                              bottom: 15.0),
                          splashColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side: BorderSide(color: color_header)),
                          onPressed: () {},
                          child: Text(
                            "Đóng",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: FlatButton(
                          color: color_header,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.only(
                              left: 100.0,
                              right: 100.0,
                              top: 15.0,
                              bottom: 15.0),
                          splashColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side: BorderSide(color: color_header)),
                          onPressed: () {},
                          child: Text(
                            "Gửi duyệt",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
  }
}
