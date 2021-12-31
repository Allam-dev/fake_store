import 'package:fake_store/presentation/screens/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends StatelessWidget {

  final Widget child;

  const AppBlocs({required this.child, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider<LoginCubit>(
         create: (_) => LoginCubit(),
       ),
      ],
      child: child,
    );
  }
}