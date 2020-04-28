import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlns/ui/constants/colors.dart';
import 'dart:ui';

class CompleteTheTimekeeping extends StatefulWidget {
  @override
  _CompleteTheTimekeeping createState() => _CompleteTheTimekeeping();
}

class _CompleteTheTimekeeping extends State<CompleteTheTimekeeping> {
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
        title: "MonthlyWorksheet",
        home: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: color_header,
            title: Center(
              child: Text(
                "Chốt công hằng ngày",
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
                padding: EdgeInsets.all(10.0),
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
                      width: MediaQuery.of(context).size.width * 0.7,
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
                    Container(
                        child: FlatButton(
                      padding: EdgeInsets.only(
                          left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                      color: color_header,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: color_header,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: color_header)),
                      onPressed: () {

                      },
                      child: Text(
                        "Chốt công",
                        style: TextStyle(fontSize: 11.0),
                        textAlign: TextAlign.center,
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "LƯU Ý: Khi đã chốt công thì ngày công làm việc không thay đổi, nên chốt công sau khi đã CHẤM OUT hoặc ngày công đã tính đủ công.",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "THÔNG TIN DỮ LIỆU NGÀY CÔNG TRONG THÁNG - ",
                              style: TextStyle(fontSize: 14.0),
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Text("03/2020",
                          style:
                              TextStyle(fontSize: 14.0, color: color_header)),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 10.0, right: 290.0),
                  child: FlatButton(
                    padding: EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                    color: Colors.grey[400],
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    splashColor: color_header,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.grey[400])),
                    onPressed: () {},
                    child: Text(
                      "Ẩn/Hiện",
                      style: TextStyle(fontSize: 11.0),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Table(
                  columnWidths: {
                    0: FixedColumnWidth(40.0),
                    2: FixedColumnWidth(120.0),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                        decoration: BoxDecoration(color: color_header),
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                            child: Center(child: Text("")),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                            child: Center(
                              child: Text(
                                "Tháng",
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
                                "Ngày",
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
                                "Công",
                                style: TextStyle(
                                    color: color_white_text1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ]),
                    TableRow(children: [
                      Container(
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: icon(),
                              onPressed: () {
                                _changeButtonInformation();
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("17/03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("0"),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: icon(),
                              onPressed: () {
                                _changeButtonInformation();
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("16/03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("1"),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: icon(),
                              onPressed: () {
                                _changeButtonInformation();
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("15/03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("1"),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: icon(),
                              onPressed: () {
                                _changeButtonInformation();
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("14/03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("0.5"),
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

  void _changeButtonInformation() {
    if (information == true) {
      setState(() {
        information = false;
      });
    } else {
      setState(() {
        information = true;
      });
    }
  }
}
