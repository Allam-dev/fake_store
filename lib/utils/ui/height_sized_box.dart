import 'package:flutter/cupertino.dart';

abstract class HeightSizedBox {
  static Widget get expanded {
    return const Expanded(
        child: SizedBox(
      height: double.infinity,
    ));
  }
}
