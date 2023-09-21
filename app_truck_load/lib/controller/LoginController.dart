import 'dart:convert';

import 'package:app_truck_load/routes/auth_route.dart';

class LoginController {
  Future<bool> login({required String login, required String senha}) async {
    var okLogin = true;

    try {
      var response = await auth(
        login: login,
        senha: senha,
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        await secureStorage.write(
            key: "CURRENT_USER_TOKEN", value: data["token"].toString());
        await secureStorage.write(
            key: "CURRENT_USER_ID", value: data["user_id"].toString());
      } else {
        throw Exception("Deu ruim");
      }
    } catch (e) {
      okLogin = false;
    }

    return okLogin;
  }

  Future<bool> logout() async {
    var okLogin = true;

    try {
      var response = await logoutApp();

      if (response.statusCode == 200) {
        await secureStorage.deleteAll();
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
