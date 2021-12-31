import 'package:dio/dio.dart';
import 'package:fake_store/data/services/remote/api/api_methods.dart';
import 'package:fake_store/data/services/remote/api/api_services.dart';

class UserApiServices {
  final ApiServices _apiServices = ApiServices.instance;

  Future<List?> getUsers() async {
    List users = [];
    await _apiServices.request(
      method: ApiMethods.get,
      endPoint: "users",
      onSuccess: (response) {
        users = response.data;
      },
    );
    return users;
  }

  void getProfile() {}
}
