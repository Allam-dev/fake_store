import 'package:fake_store/presentation/app.dart';
import 'package:flutter/material.dart';

abstract class SnackBarWithoutContext{

  static void show({required String message}){
    App.scaffoldMessengerKey.currentState?.showSnackBar(_snackBar(message: message));
  }

  static SnackBar _snackBar({required String message}){
    return SnackBar(
      content: Text(message),
    );
  }
}