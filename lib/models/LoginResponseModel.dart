// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.success,
    required this.message,
    required this.error,
    required this.data,
    required this.status,
  });

  bool success;
  Message message;
  bool error;
  Data data;
  int status;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: Message.fromJson(json["message"]),
        error: json["error"],
        data: Data.fromJson(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message.toJson(),
        "error": error,
        "data": data.toJson(),
        "status": status,
      };
}

class Data {
  Data({
    required this.id,
    required this.firstName,
    required this.loginKey,
    required this.userRole,
    required this.profileImage,
    required this.allowNotification,
    required this.loggedIn,
  });

  String id;
  String firstName;
  String loginKey;
  String userRole;
  dynamic profileImage;
  String allowNotification;
  bool loggedIn;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        firstName: json["FIRST_NAME"],
        loginKey: json["LOGIN_KEY"],
        userRole: json["USER_ROLE"],
        profileImage: json["PROFILE_IMAGE"],
        allowNotification: json["ALLOW_NOTIFICATION"],
        loggedIn: json["LOGGED_IN"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "FIRST_NAME": firstName,
        "LOGIN_KEY": loginKey,
        "USER_ROLE": userRole,
        "PROFILE_IMAGE": profileImage,
        "ALLOW_NOTIFICATION": allowNotification,
        "LOGGED_IN": loggedIn,
      };
}

class Message {
  Message({
    required this.success,
  });

  String success;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
