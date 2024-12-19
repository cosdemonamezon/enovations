import 'package:http/http.dart' as http;
import 'package:novations/constants.dart';
import 'dart:convert' as convert;

import 'package:novations/models/auth.dart';

class LoginApi {
  const LoginApi();

  //login
  static Future<Auth> login(String username, String password, String device_no, String notify_token) async {
    final url = Uri.https(publicUrl, '/enovations/api/public/api/login_app');
    final response = await http.post(url, body: {
      'username': username,
      'password': password,
      'device_no': device_no,
      'notify_token': notify_token,
    });
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return Auth.fromJson(data);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
