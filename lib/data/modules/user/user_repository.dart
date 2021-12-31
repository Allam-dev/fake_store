import 'package:fake_store/data/modules/user/user_model.dart';
import 'package:fake_store/data/modules/user/user_services/local/storage/user_storage_services.dart';
import 'package:fake_store/data/modules/user/user_services/remote/api/user_api_services.dart';
import 'package:fake_store/generated/l10n.dart';
import 'package:fake_store/utils/log.dart';

class UserRepository {
  final UserApiServices _userApiServices = UserApiServices();
  final UserStorageServices _userStorageServices = UserStorageServices();

  Future<List<UserModel>?> _getUsers() async {
    List<UserModel>? parsedUsers = [];
    List? fetchedUsers = await _userApiServices.getUsers();
    fetchedUsers?.forEach((element) {
      parsedUsers.add(UserModel.fromJson(element));
    });
    return parsedUsers;
  }

  Future<UserModel?> login({required String email, required String password}) async {
    List<UserModel>? users = await _getUsers();
    if (users != null && users.isNotEmpty) {
      for (int i = 0; i < users.length; i++) {
        Log.information("index : $i");
        UserModel user = users[i];
        if(user.email == email && user.password == password){
          return user;
        }
      }
    }
  }

  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return S.current.this_field_is_required;
    } else {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if (!emailValid) {
        return S.current.email_not_valid;
      }
    }
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return S.current.this_field_is_required;
    }
  }

  Future<void> saveId(int id) async {
    await _userStorageServices.saveId(id);
  }
  Future<int> getId() async {
    return await _userStorageServices.getId();
  }
  void getProfile() {}
  void logOut() {}
}
