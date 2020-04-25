import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlns/ui/constants/colors.dart';
import 'dart:ui';

class MonthlyWorksheet extends StatefulWidget {
  @override
  _MonthlyWorksheet createState() => _MonthlyWorksheet();
}

class _MonthlyWorksheet extends State<MonthlyWorksheet> {
  bool information = true;

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
        title: "MonthlyWorksheet",
        home: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: color_white_text1,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pushNamed("home");
              },
            ),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: color_header),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Dữ liệu chấm công nhân viên",
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
                        Navigator.of(context).pushNamed("timekeeping");
                      },
                      child: Text(
                        "Chấm công",
                        style: TextStyle(fontSize: 11.0),
                        textAlign: TextAlign.center,
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Table(
                  columnWidths: {
                    0: FixedColumnWidth(40.0),
                    1: FixedColumnWidth(120.0),
                  },
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
                                "Thông tin\nnhân viên",
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
                                "Thời gian",
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
                                "Hình ảnh",
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
                            Text("1")
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("Trần Hoàng Nam Anh\n(xxxxx)\n(Học việc)"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("07:50\n13/03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Image.asset('images/960426.png',
                            fit: BoxFit.cover, width: 100, height: 100),
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
                            Text("2")
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("Trần Hoàng Nam Anh\n(xxxxx)\n(Học việc)"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("07:50\n13/03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Image.asset('images/960426.png',
                            fit: BoxFit.cover, width: 100, height: 100),
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
                            Text("3")
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("Trần Hoàng Nam Anh\n(xxxxx)\n(Học việc)"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("07:50\n13/03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Image.asset('images/960426.png',
                            fit: BoxFit.cover, width: 100, height: 100),
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
                            Text("4")
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("Trần Hoàng Nam Anh\n(xxxxx)\n(Học việc)"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Text("07:50\n13/03/2020"),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                        child: Image.asset('images/960426.png',
                            fit: BoxFit.cover, width: 100, height: 100),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
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
