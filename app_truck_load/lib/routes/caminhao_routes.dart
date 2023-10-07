import 'dart:convert';
import 'package:app_truck_load/model/caminhao_model.dart';
import 'package:app_truck_load/utilities/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> caminhaoList({required int userId}) async {
  const urlCaminhao = "caminhao/list";

  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("CURRENT_USER_TOKEN");
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
  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("CURRENT_USER_TOKEN");
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
  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("CURRENT_USER_TOKEN");
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
  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("CURRENT_USER_TOKEN");
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode({"id": id}));
}
