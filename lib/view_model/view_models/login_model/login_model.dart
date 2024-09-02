// class LogInModel {
//   final int status;
//   final String message;
//   final String accessToken;
//   final String tokenExpiryTime;
//   final int userAreaTypeId;
//   final String username;
//   final String email;
//   final List<String> permissions;

//   LogInModel({
//     required this.status,
//     required this.message,
//     required this.accessToken,
//     required this.tokenExpiryTime,
//     required this.userAreaTypeId,
//     required this.username,
//     required this.email,
//     required this.permissions,
//   });

//   factory LogInModel.fromJson(Map<String, dynamic> json) {
//     List<dynamic> permissionsList = json['permissions'] ?? [];

//     List<String> permissions =
//         permissionsList.map((permission) => permission.toString()).toList();

//     return LogInModel(
//       status: json['status'] ?? 0,
//       message: json['message'] ?? "",
//       accessToken: json['access_token'] ?? "",
//       tokenExpiryTime: json['token_expiry_time'] ?? "",
//       userAreaTypeId: json['user_area_type_id'] ?? 0,
//       username: json['username'] ?? "",
//       email: json['email'] ?? "",
//       permissions: permissions,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'access_token': accessToken,
//       'token_expiry_time': tokenExpiryTime,
//       'user_area_type_id': userAreaTypeId,
//       'username': username,
//       'email': email,
//       'permissions': permissions, // Keep as a list
//     };
//   }
// }

// // class LogInModel {
// //   final int status;
// //   final String message;
// //   final String accessToken;
// //   final int userAreaTypeId;
// //   final String username;
// //   final String email;
// //   final List<String> permissions;

// //   LogInModel({
// //     required this.status,
// //     required this.message,
// //     required this.accessToken,
// //     required this.userAreaTypeId,
// //     required this.username,
// //     required this.email,
// //     required this.permissions,
// //   });

// //   factory LogInModel.fromJson(Map<String, dynamic> json) {
// //     List<dynamic> permissionsList = [];

// //     if (json['permissions'] != null) {
// //       permissionsList = json['permissions'];
// //     } else {
// //       permissionsList = [];
// //     }

// //     List<String> permissions =
// //         permissionsList.map((permission) => permission.toString()).toList();

// //     return LogInModel(
// //       status: json['status'] ?? 0,
// //       message: json['message'] ?? "",
// //       accessToken: json['access_token'] ?? "",
// //       userAreaTypeId: json['user_area_type_id'] ?? 0,
// //       username: json['username'] ?? "",
// //       email: json['email'] ?? "",
// //       permissions: permissions,
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'status': status,
// //       'message': message,
// //       'accessToken': accessToken,
// //       'userAreaTypeId': userAreaTypeId,
// //       'username': username,
// //       'email': email,
// //       'permissions':
// //           permissions.join(','), // Convert list to comma-separated string
// //     };
// //   }
// // }

class LogInModel {
  final int success;
  final String message;
  final DataArray dataArray;

  LogInModel({
    required this.success,
    required this.message,
    required this.dataArray,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      success: json['success'],
      message: json['message'],
      dataArray: DataArray.fromJson(json['data_array']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data_array': dataArray.toJson(),
    };
  }
}

class DataArray {
  final String token;
  final String shortToken;
  final String name;
  final String nameStr;
  final String designation;
  final String uid;
  final String photo;
  final String username;
  final int usertype;

  DataArray({
    required this.token,
    required this.shortToken,
    required this.name,
    required this.nameStr,
    required this.designation,
    required this.uid,
    required this.photo,
    required this.username,
    required this.usertype,
  });

  factory DataArray.fromJson(Map<String, dynamic> json) {
    return DataArray(
      token: json['token'] ?? '',
      shortToken: json['short_token'] ?? '',
      name: json['name'] ?? '',
      nameStr: json['name_str'] ?? '',
      designation: json['designation'] ?? '',
      uid: json['uid'] ?? '',
      photo: json['photo'] ?? '',
      username: json['username'] ?? '',
      usertype: json['usertype'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'short_token': shortToken,
      'name': name,
      'name_str': nameStr,
      'designation': designation,
      'uid': uid,
      'photo': photo,
      'username': username,
      'usertype': usertype,
    };
  }
}
