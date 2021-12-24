import 'package:flutter/cupertino.dart';

abstract class WidthSizedBox {
  static Widget get expanded {
    return const Expanded(
        child: SizedBox(
      width: double.infinity,
    ));
  }
}
