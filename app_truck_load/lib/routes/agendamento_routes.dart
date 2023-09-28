import 'dart:async';
import 'dart:convert';
import 'package:app_truck_load/model/agendamento_model.dart';
import 'package:app_truck_load/utilities/consts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const secureStorage = FlutterSecureStorage();

Future<Response> agendamentoShow({required int userId}) async {
  const urlCaminhao = "agendamento/show";

  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode({"user_id": userId}));
}

Future<Response> hasAgendamentoAtivo({required int userId}) async {
  const urlCaminhao = "agendamento/hasOperacaoAtiva";

  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode({"user_id": userId}));
}

Future<Response> agendamentoStore({required Agendamento agendamento}) async {
  const urlCaminhao = "agendamento/store";

  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode(agendamento.toJson()));
}

Future<Response> agendamentoUpdate({required Agendamento agendamento}) async {
  const urlCaminhao = "agendamento/update";

  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode(agendamento.toJson()));
}

Future<Response> agendamentoCancel({required int? id}) async {
  const urlCaminhao = "agendamento/cancel";

  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode({"id": id}));
}
