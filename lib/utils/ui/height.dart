import 'package:flutter/material.dart';

abstract class Height{
  static double screenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double screenHeightWithAppBar(BuildContext context){
    return MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top;
  }
}