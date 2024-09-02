// import 'dart:convert';

// import 'package:crm_mrs_app/model/resources/string_manager.dart';
// import 'package:crm_mrs_app/view/screens/dashboard/home.dart';
// import 'package:crm_mrs_app/view/screens/login/login.dart';
// import 'package:crm_mrs_app/view_model/view_models/login_model/login_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/response/response.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get_storage/get_storage.dart';

// class DBManager {
//   var box = GetStorage();

//   //  // save Login Data to Database
//   Future<void> saveUserData(Response response) async {
//     box.write(LocalDBStrings.login_user, jsonEncode(response.body));
//   }

//   //get Login data from database
//   Future<String> fetchLoginUserEmail() async {
//     var user = box.read(LocalDBStrings.login_user);
//     String userEmail = "";
//     if (user != null) {
//       try {
//         var decodedUser = jsonDecode(user);
//         var _user = LogInModel.fromJson(decodedUser);
//         userEmail = _user.email.toString();
//       } catch (e) {
//         debugPrint("catch:$e");
//       }
//     } else {
//       Get.offAll(() => Home());
//     }
//     return userEmail;
//   }

//   Future<String> fetchLoginUserToken() async {
//     var user = box.read(LocalDBStrings.login_user);
//     String userToken = "";
//     if (user != null) {
//       try {
//         var decodedUser = jsonDecode(user);
//         var _user = LogInModel.fromJson(decodedUser);
//         userToken = _user.accessToken.toString();
//       } catch (e) {
//         debugPrint("catch:$e");
//       }
//     } else {
//       Get.offAll(() => Home());
//     }
//     return userToken;
//   }

//   Future<LogInModel> fetchLoginUser() async {
//     var user = box.read(LocalDBStrings.login_user);
//     String userEmail = "";
//     String userToken = "";
//     if (user != null) {
//       try {
//         var decodedUser = jsonDecode(user);
//         var _user = LogInModel.fromJson(decodedUser);
//         userEmail = _user.email.toString();
//         userToken = _user.accessToken.toString();
//       } catch (e) {
//         debugPrint("catch:$e");
//       }
//     } else {
//       Get.offAll(() => Home());
//     }
//     return user;
//   }
// }
import 'dart:convert';
import 'package:crm_mrs_app/model/resources/string_manager.dart';
import 'package:crm_mrs_app/view/screens/dashboard/bottomNavBar.dart';
import 'package:crm_mrs_app/view_model/view_models/login_model/login_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DBManager {
  var box = GetStorage();

  // Save login data to database
  Future<void> saveUserData(Response response) async {
    box.write(LocalDBStrings.login_user, jsonEncode(response.body));
  }

  // Get login data from database
  Future<String> fetchLoginUserEmail() async {
    var user = box.read(LocalDBStrings.login_user);
    String userEmail = "";
    if (user != null) {
      try {
        var decodedUser = jsonDecode(user);
        var _user = LogInModel.fromJson(decodedUser);
        userEmail = _user.dataArray.nameStr.toString();
      } catch (e) {
        debugPrint("catch:$e");
      }
    } else {
      Get.offAll(() => BottomNavBar());
    }
    return userEmail;
  }

  Future<String> fetchLoginUserToken() async {
    var user = box.read(LocalDBStrings.login_user);
    String userToken = "";
    if (user != null) {
      try {
        var decodedUser = jsonDecode(user);
        var _user = LogInModel.fromJson(decodedUser);
        userToken = _user.dataArray.token.toString();
      } catch (e) {
        debugPrint("catch:$e");
      }
    } else {
      Get.offAll(() => BottomNavBar());
    }
    return userToken;
  }

  Future<LogInModel> fetchLoginUser() async {
    var user = box.read(LocalDBStrings.login_user);
    LogInModel? loginUser;
    if (user != null) {
      try {
        var decodedUser = jsonDecode(user);
        loginUser = LogInModel.fromJson(decodedUser);
      } catch (e) {
        debugPrint("catch:$e");
      }
    } else {
      Get.offAll(() => BottomNavBar());
    }
    return loginUser!;
  }
}
