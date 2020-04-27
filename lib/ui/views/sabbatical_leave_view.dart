import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:qlns/ui/constants/colors.dart';

List<String> _typeOfLeave = [
  'Nghỉ phép \n(phép năm/không lương/khác)',
  'Cá nhân sinh con \n(hưởng chế độ BHXH)',
  'Nghỉ bù trực bê tông',
  'Cá nhân kết hôn',
  'Bố mẹ (cả bên chồng và bên vợ) chết, \n vợ hoặc chồng, con chết',
  'Ông bà ngoại, \n anh chị em ruột chết',
  'Nghỉ bản thân ốm đau \n(hưởng chế độ BHXH)',
  'Nghỉ con ốm \n(hưởng chế độ BHXH)',
  'Cá nhân khám thai \n(hưởng chế độ BHXH)',
  'Vợ sinh con -1 con - \nSinh thường (hưởng chế độ BHXH)',
  'Vợ sinh con -1 con - \nSinh mổ (hưởng chế độ BHXH)',
  'Vợ sinh con -2 con - \nSinh thường (hưởng chế độ BHXH)',
  'Vợ sinh con -2 con - \nSinh mổ (hưởng chế độ BHXH)',
];
List<String> _staff = [
  'GSOT0001(Quản trị GSOT)',
  'xxxxx(Lâm Khánh Hào)',
  'xxxxx(Trần Hoàng Nam Anh)',
  'xxxxx(Phạm Trung Nghĩa)',
  'xxxxx(Nguyễn Văn Trường)',
  'xxxxx(Nguyễn Bá Hiệp)',
];

class SabbaticalLeaveView extends StatefulWidget {
  SabbaticalLeaveView({Key key}) : super(key: key);
  @override
  _SabbaticalLeaveView createState() => _SabbaticalLeaveView();
}

class _SabbaticalLeaveView extends State<SabbaticalLeaveView> {
  String dropdownValue = 'Nghỉ phép \n(phép năm/không lương/khác)';
  String dropdownValue1 = 'GSOT0001(Quản trị GSOT)';
  var startOff = DateTime.now();
  var endOff = DateTime.now();

  Widget _buildRowText(String text, String day) {
    return Container(
      width: 80.0,
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(day),
        ],
      ),
    );
  }

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

  Widget _listOfLeaveTypes() {
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
        items: _typeOfLeave.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _listOfEmployee() {
    return Container(
      child: DropdownButton<String>(
        value: dropdownValue1,
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
            dropdownValue1 = newValue;
          });
        },
        items: _staff.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
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
              backgroundColor: color_white_text1,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
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
                        "Nhập mới đăng ký nghỉ phép",
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
                      Divider(
                        color: color_header,
                      ),
                      Text("THÔNG TIN NGHỈ PHÉP"),
                      Text(
                        "Bạn đã...",
                        style: TextStyle(color: Colors.red),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Divider(
                          color: color_header,
                        ),
                      )
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
                            "Thời gian bắt đầu nghỉ phép*",
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
                            "Thời gian kết thúc nghỉ phép*",
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
                  padding: EdgeInsets.only(bottom: 20.0, left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          child: Text(
                        "Loại phép",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(
                        child: _listOfLeaveTypes(),
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
                        "Số ngày nghỉ được phép",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(
                          child: Text(
                        "2",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      )),
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
                        "Tổng số ngày đăng ký phép",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(child: Text("1")),
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
                        "Số ngày phép nghỉ chế độ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(child: Text("0")),
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
                        "Số ngày phép nghỉ có lương",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(child: Text("1")),
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
                        "Số ngày phép nghỉ không lương",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(child: Text("0")),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildRowText('Tổng số ngày phép được nghỉ', '3'),
                      _buildRowText('Số ngày phép đã nghỉ', '1'),
                      _buildRowText('Số ngày phép đang chờ duyệt', '0'),
                      _buildRowText('Số ngày phép còn lại được đăng ký', '2'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0, left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Lý do*",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 10.0, top: 5.0),
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
                  padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          child: Text(
                        "Người nhận bàn giao",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(
                        child: _listOfEmployee(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0, left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Công việc bàn giao",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 10.0, top: 5.0),
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
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "File đăng ký đơn nghỉ phép",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(right: 4.0),
                              child: FlatButton(
                                  color: color_header,
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  splashColor: Color(0xFF3a90e7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: color_header)),
                                  onPressed: () {},
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.add),
                                      Text("Chọn flie...")
                                    ],
                                  ))),
                          Container(
                              child: FlatButton(
                                  color: Colors.deepOrangeAccent,
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  splashColor: Color(0xFF3a90e7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(
                                          color: Colors.deepOrangeAccent)),
                                  onPressed: () {},
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.delete),
                                      Text("Xóa")
                                    ],
                                  ))),
                        ],
                      ),
                    ],
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
          ));
  }
}
