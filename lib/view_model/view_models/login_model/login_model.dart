class LogInModel {
  final String message;
  final User user;
  final String token;

  LogInModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      message: json['message'],
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user.toJson(),
      'token': token,
    };
  }
}

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String userType;
  final String? avatar;
  final String status;
  final int callMasking;
  final String? color;
  final String? techOption;
  final String? location;
  final String? skills;
  final String? note;
  final String? address;
  final String? city;
  final String? state;
  final String? zipCode;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.userType,
    this.avatar,
    required this.status,
    required this.callMasking,
    this.color,
    this.techOption,
    this.location,
    this.skills,
    this.note,
    this.address,
    this.city,
    this.state,
    this.zipCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      userType: json['user_type'] ?? '',
      avatar: json['avatar'],
      status: json['status'] ?? '',
      callMasking: json['call_masking'] ?? 0,
      color: json['color'],
      techOption: json['tech_option'],
      location: json['location'],
      skills: json['skills'],
      note: json['note'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zip_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'user_type': userType,
      'avatar': avatar,
      'status': status,
      'call_masking': callMasking,
      'color': color,
      'tech_option': techOption,
      'location': location,
      'skills': skills,
      'note': note,
      'address': address,
      'city': city,
      'state': state,
      'zip_code': zipCode,
    };
  }
}
