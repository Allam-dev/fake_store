import 'package:bloc/bloc.dart';
import 'package:fake_store/models/user_model.dart';
import 'package:fake_store/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  List<UserModel?> _users = [];

  final UserRepository _userRepository = UserRepository();

  void fetchAllUsers() async {
    emit(UsersLoading());
    List<UserModel>? fetchedUsers =  await _userRepository.getAllUsers;
    if(fetchedUsers != null){
      _users = fetchedUsers;
      emit(UsersLoaded());
    }else{
      emit(UsersError());
    }
  }
  void _saveUseId(){}

  List<UserModel?> get users => _users;
}
