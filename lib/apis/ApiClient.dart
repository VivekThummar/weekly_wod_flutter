import 'dart:convert';

import 'package:http/http.dart';
import 'package:weekly_wod_flutter/apis/HttpParams.dart';
import 'package:weekly_wod_flutter/models/LoginResponseModel.dart';

class HttpServices {
  final String baseUrl = 'https://potenzaglobal.net/weeklywodthrowdown/api/';

  Future<LoginResponse?> userLogin(Map<dynamic, dynamic> map) async {
    Response response = await post(Uri.parse(baseUrl + HttpParams.getLogin), body: map);
    if (response.statusCode == 200) {
      LoginResponse model = jsonDecode(response.body);
      return model;
    } else {
      return null;
    }
  }
}
