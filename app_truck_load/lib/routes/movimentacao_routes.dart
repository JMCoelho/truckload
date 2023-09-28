import 'dart:convert';
import 'package:app_truck_load/utilities/consts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/agendamento_model.dart';
import '../model/movimentacao_model.dart';

const secureStorage = FlutterSecureStorage();

Future<Response> movimentacaoShow({required int userId}) async {
  const urlCaminhao = "movimentacao/show";

  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlCaminhao),
      headers: requestHeaders, body: json.encode({"user_id": userId}));
}

Future<Response> movimentacaoStore({
  required Agendamento? agendamento,
}) async {
  const urlMovimentacao = "movimentacao/store";

  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlMovimentacao),
      headers: requestHeaders, body: json.encode(agendamento!.toJson()));
}

Future<Response> movimentacaoUpdate(
    {required Movimentacao movimentacao}) async {
  const urlMovimentacao = "movimentacao/update";

  var token = await secureStorage.read(key: "CURRENT_USER_TOKEN") ?? "";
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlMovimentacao),
      headers: requestHeaders, body: json.encode({"id": movimentacao.id}));
}
