import 'package:bloc/bloc.dart';
import 'package:fake_store/data/modules/user/user_model.dart';
import 'package:fake_store/data/modules/user/user_repository.dart';
import 'package:fake_store/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final UserRepository _userRepository = UserRepository();
  String email = "";
  String password = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (_validate) {
      emit(LoginLoading());
      _setEmailandPassword();
      UserModel? user =
          await _userRepository.login(email: email, password: password);
      if (user != null) {
        await _saveUserId(user.id!);
        emit(LoginLoaded());
      } else {
        emit(LoginError());
      }
    }
  }

  Future<void> _saveUserId(int id) async {
    await _userRepository.saveId(id);
  }

  String? emailValidator(String? email) =>
      _userRepository.emailValidator(email);

  String? passwordValidator(String? password) =>
      _userRepository.passwordValidator(password);

  bool get _validate => _formKey.currentState!.validate();
  
  void _setEmailandPassword() {
    _formKey.currentState!.save();
  }

  GlobalKey<FormState> get formKey => _formKey;
}
