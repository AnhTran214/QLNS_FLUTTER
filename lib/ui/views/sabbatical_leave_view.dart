import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qlns/core/util/utils.dart';
import 'package:qlns/ui/constants/app_strings.dart';
import 'package:qlns/ui/constants/colors.dart';
import 'package:intl/intl.dart';

final dateTimeFormat = DateFormat("HH:mm dd/MM/yyyy");

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
  TextEditingController _dateTimeStartController = TextEditingController();
  TextEditingController _dateTimeEndController = TextEditingController();
  num _totalValidDay;
  num _totalDayRegister = 1;
  String dropdownValue = 'Nghỉ phép \n(phép năm/không lương/khác)';
  String dropdownValue1 = 'GSOT0001(Quản trị GSOT)';
  var startOff = DateTime.now();
  var endOff = DateTime.now();

  void initState() {
    super.initState();
    _dateTimeStartController.value = TextEditingValue(
        text: dateTimeFormat.format(dateTimeFormat
            .parse('07:30 ' + DateFormat('dd/MM/yyyy').format(DateTime.now()))),
        selection: _dateTimeStartController.selection);

    _dateTimeEndController.value = TextEditingValue(
        text: dateTimeFormat.format(dateTimeFormat
            .parse('17:30 ' + DateFormat('dd/MM/yyyy').format(DateTime.now()))),
        selection: _dateTimeEndController.selection);
  }

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
              onPressed: () async {
                final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(
                      dateTimeFormat.parse(_dateTimeEndController.text).year,
                      dateTimeFormat.parse(_dateTimeEndController.text).month,
                      dateTimeFormat.parse(_dateTimeEndController.text).day,
                      dateTimeFormat.parse(_dateTimeEndController.text).hour +
                          1,
                    ));
                final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: 7, minute: 30));
                if (date == null) return;
                setState(() {
                  _dateTimeStartController.text = dateTimeFormat.format(
                      DateTime(date.year, date.month, date.day, time.hour,
                          time.minute));
                  checkValidDate();
                });
              },
              child: Container(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(_dateTimeStartController.text),
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
              onPressed: () async {
                final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                      dateTimeFormat.parse(_dateTimeStartController.text).year,
                      dateTimeFormat.parse(_dateTimeStartController.text).month,
                      dateTimeFormat.parse(_dateTimeStartController.text).day
                    ),
                    lastDate: DateTime(2050));
                final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: 17, minute: 30));
                if (date == null) return;
                setState(() {
                  _dateTimeEndController.text = dateTimeFormat.format(
                      DateTime(date.year, date.month, date.day, time.hour,
                          time.minute));
                  checkValidDate();
                });
              },
              child: Container(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(_dateTimeEndController.text),
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
            backgroundColor: color_header,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: color_white_text1),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Center(
              child:  Text(
                Utils.getString(context, txt_title_register_time_off),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color_white_text1),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.menu, color: color_white_text1),
                onPressed: null,
              )
            ],
          ),
          body: ListView(
            children: <Widget>[
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
              //Thời gian bắt đầu nghỉ phép
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          Utils.getString(context, txt_date_start_time_off) + "*",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      child: _startTimeOff(),
                    ),
                  ],
                ),
              ),
              //Thời gian kết thúc nghỉ phép
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          Utils.getString(context, txt_date_end_time_off)+"*",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      child: _endTimeOff(),
                    ),
                  ],
                ),
              ),
              //loại phép
              Container(
                padding: EdgeInsets.only(bottom: 20.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        child: Text(
                      Utils.getString(context, txt_type_time_off),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Container(
                      child: _listOfLeaveTypes(),
                    ),
                  ],
                ),
              ),
              //Số ngày nghỉ cho phép
              Container(
                padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        child: Text(
                      Utils.getString(context, txt_total_day_off_valid),
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
              //Tổng số ngày đăng ký
              Container(
                padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        child: Text(
                      Utils.getString(context, txt_total_day_off),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Container(child: Text("1")),
                  ],
                ),
              ),
              //Số ngày phép nghỉ chế độ
              Container(
                padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        child: Text(
                      Utils.getString(context, txt_total_day_off_regime),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Container(child: Text("0")),
                  ],
                ),
              ),
              //Số ngày phép nghỉ có lương
              Container(
                padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        child: Text(
                      Utils.getString(context, txt_total_day_off_salary),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Container(child: Text("1")),
                  ],
                ),
              ),
              //Số ngày phép nghỉ không lương
              Container(
                padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        child: Text(
                      Utils.getString(context, txt_total_day_off_not_salary),
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
                            left: 120.0, right: 120.0, top: 15.0, bottom: 15.0),
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
                            left: 100.0, right: 100.0, top: 15.0, bottom: 15.0),
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

  bool checkValidDate() {
    if (_totalValidDay != null) {
      if (_totalDayRegister > _totalValidDay) {
        Fluttertoast.showToast(
            msg: Utils.getString(context, txt_error_register_day_off),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.white70,
            textColor: Colors.black,
            fontSize: 16.0);
        return false;
      }
    }

    if (dateTimeFormat
            .parse(_dateTimeStartController.text)
            .difference(dateTimeFormat.parse(_dateTimeEndController.text))
            .inDays ==
        0) {
      if (dateTimeFormat
              .parse(_dateTimeEndController.text)
              .difference(dateTimeFormat.parse(_dateTimeStartController.text))
              .inMinutes <
          0) {
        Fluttertoast.showToast(
            msg: Utils.getString(context, txt_error_register_day_off_time),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.white70,
            textColor: Colors.black,
            fontSize: 16.0);
        return false;
      }
      if (dateTimeFormat
              .parse(_dateTimeEndController.text)
              .difference(dateTimeFormat.parse(_dateTimeStartController.text))
              .inHours <
          6) {
        Fluttertoast.showToast(
            msg: Utils.getString(context, txt_error_register_day_off_min),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.white70,
            textColor: Colors.black,
            fontSize: 16.0);
        return false;
      }
    }
    return true;
  }
}
