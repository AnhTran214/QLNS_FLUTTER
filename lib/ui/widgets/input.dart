import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 class CustomInput {
  static OutlineInputBorder customBorderInput(Color color){
    return OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(
            10.0),
        borderSide: BorderSide(
            color:
            color));
  }
}


