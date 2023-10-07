import 'dart:convert';

import 'package:app_truck_load/routes/auth_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Future<bool> login({required String login, required String senha}) async {
    var okLogin = true;

    try {
      var response = await auth(
        login: login,
        senha: senha,
      );
      final prefs = await SharedPreferences.getInstance();
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        await prefs.setString("CURRENT_USER_TOKEN", data["token"].toString());
        await prefs.setString("CURRENT_USER_ID", data["user_id"].toString());
      } else {
        throw Exception("Deu ruim");
      }
    } catch (e) {
      print(e);
      okLogin = false;
    }

    return okLogin;
  }

  Future<bool> logout() async {
    var okLogin = true;

    try {
      var response = await logoutApp();
      final prefs = await SharedPreferences.getInstance();
      if (response.statusCode == 200) {
        await prefs.remove("CURRENT_USER_TOKEN");
        await prefs.remove("CURRENT_USER_ID");
      } else {
        throw Exception("Deu ruim");
      }
    } catch (e) {
      print(e);
      okLogin = false;
    }

    return okLogin;
  }
}
