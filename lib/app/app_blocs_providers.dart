import 'package:fake_store/screens/users/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocsProviders extends StatelessWidget {

  final Widget child;

  const AppBlocsProviders({required this.child, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider<UsersCubit>(
         create: (_) => UsersCubit(),
       ),
      ],
      child: child,
    );
  }
}