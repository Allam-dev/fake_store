import 'package:fake_store/utils/ui/view.dart';
import 'package:fake_store/widgets/offline_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_view_mode.dart';

class LoginView extends View {
  const LoginView({ Key? key }) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();

  @override
  View get instance => this;
}

class _LoginViewState extends ViewState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return OfflineChecker(
      onlineWidget: ChangeNotifierProvider<LoginViewModel>(
        create: (_) => LoginViewModel(),
        child: const Scaffold(
          body: Center(child: Text("data"),),
        ),
      ),
    );
  }

  @override
  String get routeName => widget.toString();
}