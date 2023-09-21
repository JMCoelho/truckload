import 'dart:convert';
import 'package:app_truck_load/model/caminhao_model.dart';
import 'package:app_truck_load/utilities/consts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const secureStorage = FlutterSecureStorage();

Future<Response> caminhaoList({required int userId}) async {
  const urlCaminhao = "caminhao/list";

  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode({"user_id": userId}));
}

Future<Response> caminhaoStore({required Caminhao caminhao}) async {
  const urlCaminhao = "caminhao/store";
  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode(caminhao.toJson()));
}

Future caminhaoUpdate({required Caminhao caminhao}) async {
  const urlCaminhao = "caminhao/update";
  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode(caminhao.toJson()));
}

Future<Response> caminhaoDestroy({required int id}) async {
  const urlCaminhao = "caminhao/destroy";
  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode({"id": id}));
}
