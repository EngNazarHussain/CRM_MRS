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
Future<ResponseModel> login(String username, String password, String acceptSource) async {
  isLoading = true;
  update();

  // Save login time
  final loginTimestamp = DateTime.now().millisecondsSinceEpoch;
  final response = await authRepo.login(username, password, acceptSource);
  ResponseModel responseModel;

  if (response.statusCode == 200) {
    print("Response LogIn: ${response.body.toString()}");

    // Parse the response body using the updated LogInModel
    final jsonResponse = LogInModel.fromJson(response.body);

    // Check if the login was successful
    if (jsonResponse.message.toLowerCase() == "login successful") {
      final token = jsonResponse.data.accessToken;
      print("Token: $token");

      // Save the user data (if needed)
      await DBManager().saveUserData(response);
      String userEmail = await DBManager().fetchLoginUserEmail();

      // Prepare the session data to store in SharedPreferences
      final sessionData = {
        'status': jsonResponse.data.user.status, // User status (e.g., active)
        'message': jsonResponse.message, // Message from the response
        'token': token, // Access token from the response
        'first_name': jsonResponse.data.user.firstName, // User's first name
        'last_name': jsonResponse.data.user.lastName, // User's last name
        'email': jsonResponse.data.user.email, // User's email
        'phone': jsonResponse.data.user.phone, // User's phone (can be null)
        'user_type': jsonResponse.data.user.userType, // User type (admin)
        'avatar': jsonResponse.data.user.avatar, // User's avatar (can be null)
        'call_masking': jsonResponse.data.user.callMasking, // Call masking option
        'roles': jsonResponse.data.user.roles, // User roles
        'permissions': jsonResponse.data.user.permissions, // User permissions
        'login_time': loginTimestamp, // Login timestamp
      };

      // Save session data to SharedPreferences
      saveSessionData(sessionData);

      funToast(jsonResponse.message, Colors.green);

      print("Login time: $loginTimestamp");
      print("Session data saved!");
      print("Hello $userEmail");

      // Return successful response model
      responseModel = ResponseModel(true, jsonResponse.message);
    } else {
      // Handle failure case (e.g., wrong credentials)
      responseModel = ResponseModel(false, jsonResponse.message);
    }
  } else {
    // Handle unexpected response status
    print('Unexpected response status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    responseModel = ResponseModel(false, response.statusText ?? 'Error');
  }

  isLoading = false;
  update();
  return responseModel;
}


}
