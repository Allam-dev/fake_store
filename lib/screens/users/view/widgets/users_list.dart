import 'package:fake_store/screens/users/cubit/users_cubit.dart';
import 'package:fake_store/screens/users/view/widgets/user_card.dart';
import 'package:fake_store/utils/ui/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersCubit usersCubit = BlocProvider.of<UsersCubit>(context);
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersLoaded) {
          // return ListView.builder(
          //   itemCount: usersCubit.users.length,
          //   itemBuilder: (context, index) {
          //     return UserCard(userIndex: index,);
          //   },
          // );
          return Center(
            child: CircularProgressIndicator(
              color: ColorsUtils.red,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: ColorsUtils.red,
            ),
          );
        }
      },
    );
  }
}
