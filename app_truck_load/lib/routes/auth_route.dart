import 'dart:convert';
import 'package:app_truck_load/utilities/consts.dart';
import 'package:app_truck_load/model/auth_model.dart';
import 'package:app_truck_load/utilities/secure_storage.dart';

import 'package:http/http.dart' as http;

const secureStorage = SecureStorage();

Future<void> auth() async {
  const urlMovimentacao = "auth/login";

  final response = await http.post(Uri.parse(Consts.url + urlMovimentacao));

  if (response.statusCode == 200) {
    var data = Auth.fromJson(json.decode(response.body));
    await secureStorage.write(key: "CURRENT_USER", value: data.toJson());
  } else {
    throw Exception("Deu ruim");
  }
}

Future<void> logout() async {
  const urlMovimentacao = "auth/logout";

  final response = await http.post(Uri.parse(Consts.url + urlMovimentacao));

  if (response.statusCode == 200) {
    await secureStorage.deleteAll();
  } else {
    throw Exception("Deu ruim");
  }
}
