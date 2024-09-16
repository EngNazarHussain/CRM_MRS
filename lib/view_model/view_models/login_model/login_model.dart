class LogInModel {
  final int status;
  final String message;
  final Data data;

  LogInModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class Data {
  final String accessToken;
  final User user;

  Data({
    required this.accessToken,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json['access_token'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'user': user.toJson(),
    };
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String userType;
  final String? avatar;
  final String status;
  final int callMasking;
  final List<String> roles;
  final List<String> permissions;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.userType,
    this.avatar,
    required this.status,
    required this.callMasking,
    required this.roles,
    required this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      userType: json['user_type'],
      avatar: json['avatar'],
      status: json['status'],
      callMasking: json['call_masking'],
      roles: List<String>.from(json['roles'] ?? []),
      permissions: List<String>.from(json['permissions'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'user_type': userType,
      'avatar': avatar,
      'status': status,
      'call_masking': callMasking,
      'roles': roles,
      'permissions': permissions,
    };
  }
}
