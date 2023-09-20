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
  const aaa = FlutterSecureStorage();

  // var tokenData = await secureStorage
  //     .readOne(key: "CURRENT_USER")
  //     .then((String result) {} as FutureOr Function(String? value));

  var a = await aaa.read(key: "CURRENT_USER") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $a"
  };

  return await http.post(Uri.parse(Consts.url + urlMovimentacao),
      headers: requestHeaders);
}
