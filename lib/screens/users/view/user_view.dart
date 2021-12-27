import 'package:fake_store/generated/l10n.dart';
import 'package:fake_store/screens/users/cubit/users_cubit.dart';
import 'package:fake_store/screens/users/view/widgets/users_list.dart';
import 'package:fake_store/utils/ui/view.dart';
import 'package:fake_store/widgets/online_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends View {
  const UserView({ Key? key }) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();

  @override
  View get instance => this;
}

class _UserViewState extends ViewState<UserView> {


  @override
  void initState() {
    BlocProvider.of<UsersCubit>(context).fetchAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OnlineBuilder(
      onlineWidget: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).select_user),
        ),
         body: const UsersList(),
      ),
    );
  }

  @override
  String get routeName => widget.toString();
}