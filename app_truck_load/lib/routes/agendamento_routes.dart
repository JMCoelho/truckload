import 'dart:async';
import 'dart:convert';
import 'package:app_truck_load/model/agendamento_model.dart';
import 'package:app_truck_load/utilities/consts.dart';
import 'package:app_truck_load/utilities/secure_storage.dart';
import 'package:app_truck_load/model/auth_model.dart';

import 'package:http/http.dart' as http;

const secureStorage = SecureStorage();

Future<Agendamento> agendamentoShow() async {
  const urlCaminhao = "Agendamento/show";

  var tokenData = await secureStorage
      .readOne(key: "CURRENT_USER")
      .then((String result) {} as FutureOr Function(String? value));

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $tokenData.access_token"
  };
  final response = await http.post(Uri.parse(Consts.url + urlCaminhao));

  if (response.statusCode == 200) {
    return Agendamento.fromJson(json.decode(response.body));
  } else {
    throw Exception("Deu ruim");
  }
}

Future<Agendamento> agendamentoStore() async {
  const urlCaminhao = "Agendamento/store";

  final response = await http.post(Uri.parse(Consts.url + urlCaminhao));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (data.sucesso) {
      return Agendamento.fromJson(data.Agendamento);
    } else {
      throw Exception(data.mensagem);
    }
  } else {
    throw Exception("Deu ruim");
  }
}

Future agendamentoUpdate() async {
  const urlCaminhao = "Agendamento/update";

  final response = await http.post(Uri.parse(Consts.url + urlCaminhao));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (!data.sucesso) {
      throw Exception(data.mensagem);
    }
  } else {
    throw Exception("Deu ruim");
  }
}

Future agendamentoCancel() async {
  const urlCaminhao = "Agendamento/cancel";

  final response = await http.post(Uri.parse(Consts.url + urlCaminhao));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (!data.sucesso) {
      throw Exception(data.mensagem);
    }
  } else {
    throw Exception("Deu ruim");
  }
}
