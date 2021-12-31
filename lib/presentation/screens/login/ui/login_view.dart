import 'package:fake_store/generated/l10n.dart';
import 'package:fake_store/presentation/screens/login/cubit/login_cubit.dart';
import 'package:fake_store/presentation/screens/login/ui/widgets/login_button.dart';
import 'package:fake_store/presentation/widgets/online_builder.dart';
import 'package:fake_store/presentation/widgets/view.dart';
import 'package:fake_store/utils/ui/app_colors.dart';
import 'package:fake_store/utils/ui/height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return OnlineBuilder(
        onlineWidget: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          height: Height.screenHeightWithAppBar(context),
          child: Form(
            key: loginCubit.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.remove_shopping_cart,
                  size: 100,
                  color: AppColors.red,
                ),
                Column(
                  children: [
                    TextFormField(
                      validator: (email) => loginCubit.emailValidator(email),
                      onSaved: (email) {
                        loginCubit.email = email!;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: S.of(context).email,
                      ),
                    ),
                    // HeightSizedBox.expanded,
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      validator: (password) =>
                          loginCubit.passwordValidator(password),
                      decoration: InputDecoration(
                        hintText: S.of(context).password,
                      ),
                      onSaved: (password) {
                        loginCubit.password = password!;
                      },
                    ),
                  ],
                ),
                const LoginButton(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  @override
  String get routeName => widget.toString();
}
