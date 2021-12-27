import 'package:fake_store/models/user_model.dart';
import 'package:fake_store/screens/users/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCard extends StatelessWidget {

  final int _userIndex;

  const UserCard({Key? key, required int userIndex}) : _userIndex = userIndex,super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersCubit usersCubit = BlocProvider.of<UsersCubit>(context);
    UserModel user =  usersCubit.users[_userIndex]!;
    return Card(
      child: ListTile(
        title: Text("${user.name?.firstname}"),
        subtitle: Text("${user.email}"),
      ),
    );
  }
}
