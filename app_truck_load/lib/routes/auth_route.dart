import 'dart:convert';
import 'package:app_truck_load/utilities/consts.dart';
import 'package:app_truck_load/model/auth_model.dart';
import 'package:app_truck_load/utilities/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const secureStorage = SecureStorage();

Future<Response> auth({required String login, required String senha}) async {
  const urlMovimentacao = "auth/login";

  return await http.post(Uri.parse(Consts.url + urlMovimentacao),
      body: {"login": login, "password": senha});
}

Future<Response> logoutApp() async {
  const urlMovimentacao = "auth/logout";
  const secureStorage = FlutterSecureStorage();

  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlMovimentacao),
      headers: requestHeaders);
}
