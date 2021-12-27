import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fake_store/data_providers/remote/api/api_methods.dart';
import 'package:fake_store/data_providers/remote/api/api_services.dart';
import 'package:fake_store/data_providers/remote/api/http_status_codes.dart';
import 'package:fake_store/models/user_model.dart';
import 'package:fake_store/utils/log.dart';

class UserRepository {
  final ApiServices _apiServices = ApiServices.instance;

  Future<List<UserModel>?> get getAllUsers async {
    List<UserModel>? users = [];
    Response? response =  await _apiServices.request(
      method: ApiMethods.get,
      endPoint: "users",
    );

    if(response != null && response.statusCode == HttpStatusCodes.success){
      Log.information("$response");
      List jsonData = response.data;
      for (var element in jsonData) { 
        users.add(UserModel.fromJson(element));
      }
      return users;
    }
  }

  void saveId() {}
  void getProfile() {}
  void logOut() {}
}
