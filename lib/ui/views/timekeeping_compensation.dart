import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:qlns/ui/constants/colors.dart';

List<String> _typeOfTimekeepingCompensation = [
  '--Chọn Loại bù công--',
  'Quên in',
  'Quên out',
];

class TimekeepingCompensation extends StatefulWidget {
  TimekeepingCompensation({Key key}) : super(key: key);
  @override
  _TimekeepingCompensation createState() => _TimekeepingCompensation();
}

class _TimekeepingCompensation extends State<TimekeepingCompensation> {
  String dropdownValue = '--Chọn Loại bù công--';
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

  Widget _session() {
    return Container(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 20,
        elevation: 16,
        style: TextStyle(color: color_header),
        underline: Container(
          height: 0,
          color: color_header,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: _typeOfTimekeepingCompensation
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Thông báo'),
            content: new Text('Bạn có chắc muốn thoát ứng dụng?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Không'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Có'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: color_header,
              highlightColor: color_header,
              accentColor: color_header),
          title: "Xin phep",
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: color_white_text1,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pushNamed("home");
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.black),
                  onPressed: null,
                )
              ],
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: color_header),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Nhập mới đăng ký bù công",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color_white_text1),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: color_white_icons,
                          ),
                          onPressed: null)
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(10.0),
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
                  padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Ngày làm việc*",
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
                            "Loại bù công",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.only(left: 5.0),
                        child: _session(),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Thời gian bắt đầu ca:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "08:00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        )
                      ],
                    )),
                Container(
                    padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Thời gian kết thúc ca:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "17:30",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Thời gian*",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(5.0),
                          child: Text("17:30")),
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
                        "Số lần bù công trong tháng",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("0")),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          "Diễn giải lý do*",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(5.0),
                          child: TextField(
                            maxLines: 15,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '',
                            ),
                          ))
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    "Lý do không được để trống!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
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
          )),
    );
  }
}
