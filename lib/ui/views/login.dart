import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlns/core/models/authentication.dart';
import 'package:qlns/ui/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qlns/ui/widgets/input.dart';

class Login extends StatefulWidget {
  Login({this.auth, this.loginCallback});
  final BaseAuth auth;
  final VoidCallback loginCallback;
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = " ";
  bool _isLoginForm;
  bool _isLoading;
  FocusNode _emailFocus;
  FocusNode _passFocus;
  //Check if form is valid before perform login or sign up
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or sign up
  void validateAndSubmit() async {
    this._emailFocus.unfocus();
    this._passFocus.unfocus();
    if (validateAndSave()) {
      setState(() {
        _errorMessage = "";
        _isLoading = true;
      });
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth
              .signIn(emailController.text, passwordController.text);
          Fluttertoast.showToast(
              msg: "Đăng nhập thành công",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.white70,
              textColor: Colors.black,
              fontSize: 16.0);
        }
        setState(() {
          _isLoading = false;
        });
        //if correct, it will change to logged in status
        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    _emailFocus=FocusNode();
    _passFocus=FocusNode();
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
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
              primaryColor: Colors.white,
              highlightColor: Colors.blueAccent,
              accentColor: Colors.blueAccent),
          title: "This home page",
          home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background_blue.png"),
                    fit: BoxFit.fill)),
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                              height: MediaQuery.of(context).size.height,
                              child: Center(
                                child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          'images/logo2-3.png',
                                          fit: BoxFit.cover,
                                          width: 250,
                                          height: 120,
                                        ),
                                        Container(
                                          child: Text(
                                            "ỨNG DỤNG CHẤM CÔNG",
                                            style: TextStyle(
                                                color: color_white_text1,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: TextFormField(
                                            focusNode: this._emailFocus,
                                            style: TextStyle(
                                                color: color_white_text1),
                                            controller: emailController,
                                            maxLines: 1,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            autofocus: false,
                                            validator: (input) {
                                              if (input.isEmpty) {
                                                return 'Email không được bỏ trống';
                                              }
                                              return null;
                                            },
                                            onSaved: (input) =>
                                                //_email = input.trim(),
                                                emailController.text = input,
                                            decoration: InputDecoration(
                                              errorBorder:CustomInput.customBorderInput(
                                                  Colors.red) ,
                                              focusedErrorBorder:
                                                  CustomInput.customBorderInput(
                                                      Colors.white),
                                              focusedBorder:
                                                  CustomInput.customBorderInput(
                                                      Colors.white),
                                              enabledBorder:
                                                  CustomInput.customBorderInput(
                                                      Colors.white),
                                              hintStyle: TextStyle(
                                                  color: Colors.white70),
                                              icon: Icon(
                                                Icons.person,
                                                color: color_white_icons,
                                              ),
                                              labelText: 'Email',
                                              labelStyle: TextStyle(
                                                  color: color_white_text1),
                                              hintText: 'Nhập email của bạn...',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: TextFormField(
                                            focusNode: this._passFocus,
                                            style: TextStyle(
                                                color: color_white_text1),
                                            controller: passwordController,
                                            maxLines: 1,
                                            autofocus: false,
                                            validator: (input) {
                                              if (input.length < 6) {
                                                return 'Mật khẩu không được nhỏ hơn 6 ký tự';
                                              }
                                              return null;
                                            },
                                            onSaved: (input) =>
                                                passwordController.text = input,
                                            decoration: InputDecoration(
                                              disabledBorder: CustomInput.customBorderInput(
                                                  Colors.white),
                                              focusedErrorBorder:
                                              CustomInput.customBorderInput(
                                                  Colors.white),
                                              errorBorder:CustomInput.customBorderInput(
                                                  Colors.red) ,
                                              focusedBorder:
                                                  CustomInput.customBorderInput(
                                                      Colors.white),
                                              enabledBorder:
                                                  CustomInput.customBorderInput(
                                                      Colors.white),
                                              hintStyle: TextStyle(
                                                  color: Colors.white70),
                                              icon: Icon(
                                                Icons.lock,
                                                color: color_white_icons,
                                              ),
                                              labelText: 'Mật khẩu',
                                              labelStyle: TextStyle(
                                                  color: color_white_text1),
                                              hintText:
                                                  'Nhập mật khẩu của bạn...',
                                            ),
                                            obscureText: true,
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
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        10.0),
                                                side: BorderSide(
                                                    color: color_header)),
                                            onPressed: validateAndSubmit,
                                            child: Text(
                                              "Đăng nhập",
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: FlatButton(
                                            textColor: Colors.white,
                                            splashColor: Colors.blueAccent,
                                            onPressed: () {},
                                            child: Text(
                                              "Bạn quên tên đăng nhập/mật khẩu?",
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                          ),
                                        ),
                                        showErrorMessage(),
                                      ],
                                    )),
                              ))
                        ],
                      ),
                    ),
                    _showCircularProgress(),
                  ],
                )),
          )),
    );
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
}
