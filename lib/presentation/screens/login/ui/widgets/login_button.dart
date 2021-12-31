import 'package:fake_store/generated/l10n.dart';
import 'package:fake_store/presentation/screens/login/cubit/login_cubit.dart';
import 'package:fake_store/utils/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return MaterialButton(
            onPressed: () {},
            child: const CircularProgressIndicator(),
          );
        } else {
          return MaterialButton(
            onPressed: () {
              BlocProvider.of<LoginCubit>(context).login();
            },
            minWidth: double.infinity,
            color: AppColors.red,
            padding: const EdgeInsets.all(3),
            child: Text(S.of(context).logIn,style: TextStyle(color: AppColors.white,fontSize: 15),),
          );
        }
      },
    );
  }
}
