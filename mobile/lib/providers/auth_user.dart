import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Auth with ChangeNotifier {
  String _login = '';
  DateTime? _loginExpiry = null;
  String _userId = '';

  String get userLogin {
    if (_login.isEmpty &&
        _loginExpiry != null &&
        _loginExpiry!.isAfter(DateTime.now())) {
      return _login;
    }
    return '';
  }

  bool get userAuth {
    return !userLogin.isEmpty;
  }

  String get userId {
    return _userId;
  }

  Future<void> signIn(String emailAddress, String password) async {
    const url = "http://10.0.2.2/api/v1/login";
    var request = {"email": emailAddress, "password": password};
    try {
      final response =
          await http.post(Uri.parse(url), body: json.encode(request));
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData['status'] != 200) {
        throw Exception(responseData['body']);
      }
      var responseBody = responseData['body'];
      _userId = responseBody['_id'];
      _loginExpiry = responseData['timestamp'] as DateTime;
      _login = 'Success';
    } catch (error) {
      _login = error.toString();
    }
  }

  Future<void> registerUser(
      String name, String surname, String emailAddress, String password) async {
    const url = "http://10.0.2.2:8000/api/v1/register";
    var request = {
      "email": emailAddress,
      "password": password,
      "name": name,
      "surname": surname,
    };
    try {
      final response =
          await http.post(Uri.parse(url), body: request);
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      print(responseData.toString());
      if (responseData['status'] != 200) {
        throw Exception(responseData['body']);
      }
      _userId = responseData["body"];
      _login = "Success";
      _loginExpiry = responseData["timestamp"];
    } catch (error) {
      _login = error.toString();
      throw Exception(error.toString());
    }
  }
}
