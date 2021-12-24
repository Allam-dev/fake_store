import 'package:fake_store/data_providers/remote/api/api_methods.dart';
import 'package:fake_store/data_providers/remote/api/api_services.dart';
import 'package:fake_store/screens/login/widgets/email_field.dart';
import 'package:fake_store/utils/ui/view.dart';
import 'package:fake_store/widgets/offline_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_view_mode.dart';

class LoginView extends View {
  const LoginView({Key? key}) : super(key: key);

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
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  children: const [
                    Icon(Icons.remove_shopping_cart,size: 100,),
                    EmailField(),
                    EmailField()
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () async {
              await ApiServices.instance.request(
                  method: ApiMethods.post,
                  endPoint: "auth/login",
                  data: {"username": "mor_2314", "password": null});
            }),
          ),
        ),
      ),
    );
  }

  @override
  String get routeName => widget.toString();
}
