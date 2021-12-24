import 'package:flutter/material.dart';
import 'package:fake_store/generated/l10n.dart';


class EmailField extends StatelessWidget {
  const EmailField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: S.of(context).email,
      ),
    );
  }
}