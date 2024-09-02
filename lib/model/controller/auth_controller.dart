import 'package:crm_mrs_app/model/apis/api_client.dart';
import 'package:crm_mrs_app/model/database/local_db.dart';
import 'package:crm_mrs_app/model/repository/auth_repo.dart';
import 'package:crm_mrs_app/model/response/response_model.dart';
import 'package:crm_mrs_app/model/shared_preferences/share_preferences_session.dart';
import 'package:crm_mrs_app/view/widgets/dialogs/custom_toast.dart';
import 'package:crm_mrs_app/view_model/view_models/login_model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo = AuthRepo(apiClient: ApiClient());
  bool isLoading = false;
  AuthController() {}

  @override
  void onInit() {
    super.onInit();
    // initDB();
  }

  Future<ResponseModel> login(
      String username, String password, String source) async {
    isLoading = true;
    update();
    // Save login time
    final loginTimestamp = DateTime.now().millisecondsSinceEpoch;
    final loginDateTime = DateTime.fromMillisecondsSinceEpoch(loginTimestamp);
    final response = await authRepo.login(username, password, source);
    ResponseModel responseModel;

    if (response.statusCode == 200) {
      print("Response LogIn :" + response.body.toString());

      // Since response.body is already a map, no need to decode it again
      final jsonResponse = LogInModel.fromJson(response.body);
      final status = jsonResponse.success;

      if (status == 1) {
        final longToken = jsonResponse.dataArray.token;
        print(longToken);

        await DBManager().saveUserData(response);
        String userEmail = await DBManager().fetchLoginUserEmail();

        final sessionData = {
          'status': jsonResponse.success,
          'message': jsonResponse.message,
          'token': jsonResponse.dataArray.token,
          'short_token': jsonResponse.dataArray.shortToken,
          'name': jsonResponse.dataArray.name,
          'name_str': jsonResponse.dataArray.nameStr,
          'designation': jsonResponse.dataArray.designation,
          'uid': jsonResponse.dataArray.uid,
          'photo': jsonResponse.dataArray.photo,
          'username': jsonResponse.dataArray.username,
          'usertype': jsonResponse.dataArray.usertype,
          'login_time': loginTimestamp,
        };

        saveSessionData(sessionData);
        funToast(jsonResponse.message, Colors.green);

        print("Login time $loginTimestamp");
        print("session data saved!");
        print("Hello $userEmail");
        responseModel = ResponseModel(true, jsonResponse.message);
      } else {
        // funToast(jsonResponse.message, Colors.red);
        responseModel = ResponseModel(false, jsonResponse.message);
      }
    } else {
      print('Unexpected response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      responseModel = ResponseModel(false, response.statusText.toString());
    }
    isLoading = false;
    update();
    return responseModel;
  }

  // Future<ResponseModel> login(String username, String password) async {
  //   isLoading = true;
  //   update();
  //   // Save login time
  //   final loginTimestamp = DateTime.now().millisecondsSinceEpoch;
  //   final loginDateTime = DateTime.fromMillisecondsSinceEpoch(loginTimestamp);
  //   final response = await authRepo.login(username, password);
  //   ResponseModel responseModel;

  //   if (response.statusCode == 200) {
  //     print("Response LogIn :" + response.body.toString());

  //     // final Map<String, dynamic> responseData = json.decode(response.body);

  //     final jsonResponse = LogInModel.fromJson(response.body);
  //     final status = jsonResponse.status;
  //     final longtoken = jsonResponse.accessToken;
  //     print(longtoken);

  //     if (status == 1) {
  //       await DBManager().saveUserData(response);
  //       String userEmail = await DBManager().fetchLoginUserEmail();

  //       final sessionData = {
  //         'status': jsonResponse.status,
  //         'message': jsonResponse.message,
  //         'access_token': jsonResponse.accessToken,
  //         'token_expiry_time': jsonResponse.tokenExpiryTime,
  //         'user_area_type_id': jsonResponse.userAreaTypeId,
  //         'username': jsonResponse.username,
  //         'email': jsonResponse.email,
  //         'permissions': jsonResponse.permissions,
  //         'login_time': loginTimestamp,
  //       };

  //       saveSessionData(sessionData);
  //       funToast(jsonResponse.message, Colors.green);

  //       print("Login time $loginTimestamp");
  //       print("session data saved!");
  //       print("Hello $userEmail");
  //       responseModel = ResponseModel(true, response.body['message']);
  //     } else {
  //       responseModel = ResponseModel(false, response.body['message']);
  //     }
  //   } else {
  //     print('Unexpected response status code: ${response.statusCode}');
  //     print('Response body: ${response.body}');

  //     responseModel = ResponseModel(false, response.statusText.toString());
  //   }
  //   isLoading = false;
  //   update();
  //   return responseModel;
  // }
}
