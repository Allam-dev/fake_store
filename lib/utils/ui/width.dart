import 'package:flutter/cupertino.dart';

abstract class Width {
  static Widget get expanded {
    return const Expanded(
        child: SizedBox(
      width: double.infinity,
    ));
  }
}
