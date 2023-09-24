import 'dart:convert';

import 'package:app_truck_load/model/agendamento_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../routes/agendamento_routes.dart';

class AgendamentoController {
  static const secureStorage = FlutterSecureStorage();

  Future<Agendamento> show() async {
    var userId = await secureStorage.read(key: "CURRENT_USER_ID") ?? "0";

    Agendamento agendamento = Agendamento(
        placa: "",
        carreta: "",
        notaFiscal: "",
        destino: "",
        userId: userId,
        dataAgendada: DateTime(2023),
        status: 0,
        tipo: 0);

    try {
      var response = await agendamentoShow(userId: int.parse(userId));

      if (response.statusCode == 200) {
        agendamento = Agendamento.fromJson(json.decode(response.body));
      } else {
        throw Exception("Deu ruim");
      }
    } catch (e) {
      print(e);
    }

    return agendamento;
  }

  Future<bool> addAgendamento(
      {required String placa,
      required String placaCarreta,
      required String destino,
      required String data,
      required String notaFiscal,
      required int tipo}) async {
    var userId = await secureStorage.read(key: "CURRENT_USER_ID") ?? "0";

    Agendamento agendamento = Agendamento(
        placa: placa,
        carreta: placaCarreta,
        notaFiscal: notaFiscal,
        destino: destino,
        userId: userId,
        dataAgendada: DateTime.parse(data),
        tipo: tipo,
        status: 0);

    var ok = true;
    try {
      var response = await agendamentoStore(agendamento: agendamento);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (!data["sucesso"]) {
          throw Exception(data["mensagem"]);
        }
      } else {
        throw Exception("Deu ruim");
      }
    } catch (e) {
      ok = false;
    }

    return ok;
  }

  Future<bool> updateAgendamento(
      {required String placaCarreta,
      required String notaFiscal,
      required int id}) async {
    var ok = true;
    try {
      var response = await agendamentoUpdate(
          placaCarreta: placaCarreta, notaFiscal: notaFiscal, id: id);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (!data["sucesso"]) {
          throw Exception(data.mensagem);
        }
      } else {
        throw Exception("Deu ruim");
      }
    } catch (e) {
      ok = false;
    }

    return ok;
  }

  Future<bool> cancel({required int id}) async {
    var ok = true;

    try {
      var response = await agendamentoCancel(id: id);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (!data["sucesso"]) {
          throw Exception(data.mensagem);
        }
      } else {
        throw Exception("Deu ruim");
      }
    } catch (e) {
      print(e);
      ok = false;
    }

    return ok;
  }
}
