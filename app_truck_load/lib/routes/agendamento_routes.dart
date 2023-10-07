import 'dart:async';
import 'dart:convert';
import 'package:app_truck_load/model/agendamento_model.dart';
import 'package:app_truck_load/utilities/consts.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Response> agendamentoShow({required int userId}) async {
  const urlCaminhao = "agendamento/show";

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

Future<Response> hasAgendamentoAtivo({required int userId}) async {
  const urlCaminhao = "agendamento/hasOperacaoAtiva";
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

Future<Response> agendamentoStore({required Agendamento agendamento}) async {
  const urlCaminhao = "agendamento/store";

  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("CURRENT_USER_TOKEN");
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

  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("CURRENT_USER_TOKEN");
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
