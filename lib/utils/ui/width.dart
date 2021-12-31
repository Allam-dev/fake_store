import 'package:flutter/material.dart';

abstract class Width{
  static double screenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}