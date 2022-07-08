import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    bool? success,
    Message? message,
    bool? error,
    Data? data,
    int? status,
  }) {
    _success = success;
    _message = message;
    _error = error;
    _data = data;
    _status = status;
  }

  LoginResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
    _error = json['error'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
  }

  bool? _success;
  Message? _message;
  bool? _error;
  Data? _data;
  int? _status;

  bool? get success => _success;

  Message? get message => _message;

  bool? get error => _error;

  Data? get data => _data;

  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    map['error'] = _error;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? firstname,
    String? loginkey,
    String? userrole,
    dynamic profileimage,
    String? allownotification,
    bool? loggedin,
  }) {
    _id = id;
    _firstname = firstname;
    _loginkey = loginkey;
    _userrole = userrole;
    _profileimage = profileimage;
    _allownotification = allownotification;
    _loggedin = loggedin;
  }

  Data.fromJson(dynamic json) {
    _id = json['ID'];
    _firstname = json['FIRST_NAME'];
    _loginkey = json['LOGIN_KEY'];
    _userrole = json['USER_ROLE'];
    _profileimage = json['PROFILE_IMAGE'];
    _allownotification = json['ALLOW_NOTIFICATION'];
    _loggedin = json['LOGGED_IN'];
  }

  String? _id;
  String? _firstname;
  String? _loginkey;
  String? _userrole;
  dynamic _profileimage;
  String? _allownotification;
  bool? _loggedin;

  String? get id => _id;

  String? get firstname => _firstname;

  String? get loginkey => _loginkey;

  String? get userrole => _userrole;

  dynamic get profileimage => _profileimage;

  String? get allownotification => _allownotification;

  bool? get loggedin => _loggedin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = _id;
    map['FIRST_NAME'] = _firstname;
    map['LOGIN_KEY'] = _loginkey;
    map['USER_ROLE'] = _userrole;
    map['PROFILE_IMAGE'] = _profileimage;
    map['ALLOW_NOTIFICATION'] = _allownotification;
    map['LOGGED_IN'] = _loggedin;
    return map;
  }
}

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    String? success,
  }) {
    _success = success;
  }

  Message.fromJson(dynamic json) {
    _success = json['success'];
  }

  String? _success;

  String? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    return map;
  }
}
