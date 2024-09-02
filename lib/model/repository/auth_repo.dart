import 'dart:async';
import 'package:crm_mrs_app/model/apis/api_client.dart';
import 'package:crm_mrs_app/model/resources/string_manager.dart';
import 'package:get/get.dart';

class AuthRepo {
  final ApiClient apiClient;
  AuthRepo({
    required this.apiClient,
  });

  Future<Response> login(
      String username, String password, String source) async {
    return await apiClient.postData(AppStrings.LOGIN_URI,
        {"username": username, "password": password, "device_token": source});
  }
}
