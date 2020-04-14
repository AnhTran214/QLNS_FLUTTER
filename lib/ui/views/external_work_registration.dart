import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:qlns/core/navigation/navigate.dart';
import 'package:qlns/ui/constants/colors.dart';


class ExternalWorkRegistration extends StatefulWidget {
  ExternalWorkRegistration({Key key}) : super(key: key);
  @override
  _ExternalWorkRegistration createState() => _ExternalWorkRegistration();
}

class _ExternalWorkRegistration extends State<ExternalWorkRegistration> {
  bool _check = false;
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
          title: "ExternalWorkRegistration",
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: color_white_text1,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigation().goToExternalWork(context);
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
                        "Nhập mới đăng ký công tác ngoài",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color_white_text1,
                            fontSize: 12.0),
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
                      Text(
                        "Đơn xin công tác",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "LƯU Ý: Lựa chọn vị trí công tác hoặc địa chỉ nơi đến công tác ngoài phải chính xác để thực hiện chấm công tại địa điểm đăng ký!",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "LƯU Ý: Hệ thống chỉ ghi nhận THỜI GIAN CHẤM CÔNG trong thời gian đăng ký công tác ngoài. Nếu chấm công trước và sau thời gian công tác, thì Hệ thống không ghi nhận!",
                          style: TextStyle(color: Colors.red),
                        ),
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
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Công tác trên 500km",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Checkbox(
                          onChanged: (bool resp) {
                            setState(() {
                              _check = resp;
                            });
                          },
                          value: _check,
                        ),
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
                        "Phương tiện công tác*",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 10.0, top: 5.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                                hintText:
                                    'Tự túc / máy bay / tàu hỏa / xe khách',
                                hintStyle: TextStyle(fontSize: 12.0)),
                          ))
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
                            "Thời gian bắt đầu*",
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
                            "Thời gian kết thúc*",
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
                        "Địa điểm công tác",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Container(
                          child: Text(
                        "Table",
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0, left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Nội dung công tác*",
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
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Vị trí công tác (Click chọ vị trí công tác trên bản đồ nếu vị trí khác vị trí công tác mặc định)",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    color: color_header,
                  ),
                ),
                /*Map*/
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Tệp đứng kèm",
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
          )),
    );
  }
}
