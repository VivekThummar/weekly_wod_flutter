import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weekly_wod_flutter/apis/HttpParams.dart';
import 'package:weekly_wod_flutter/models/LoginResponse.dart';

class HttpServices {
  final String baseUrl = 'https://potenzaglobal.net/weeklywodthrowdown/api/';

  String accessToken = "WeeklythrowWood072a653";
  String authorizationUserName = "0fca3496da7d4148e13c054257edf4fc";
  String authorizationPassword = "0fca3496da7d4148e13c054257edf4fc";
  String usernameAndPassword = '';
  Map<String, String> headers = {};

  HttpServices() {
    usernameAndPassword = "$authorizationUserName:$authorizationPassword";

    String creds = 'Basic ' + base64Encode(utf8.encode(usernameAndPassword));

    headers = {
      // 'content-type': 'application/form-data',
      'Authorization': creds,
      'Access-Token': accessToken,
      'Login-Key': ''
    };
  }

  Future<LoginResponse> userLogin(Map<dynamic, dynamic> map) async {
    Response response = await post(Uri.parse(baseUrl + HttpParams.getLogin),
        headers: headers, body: map);
    if (response.statusCode == 200) {
      debugPrint(response.body);
      LoginResponse model = LoginResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      return LoginResponse();
    }
  }
}
