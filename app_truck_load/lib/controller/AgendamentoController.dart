import 'dart:convert';

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:app_truck_load/model/agendamento_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:share_plus/share_plus.dart';

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
        dataAgendada: "",
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
        dataAgendada: data,
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

  Future<bool> updateAgendamento({required Agendamento agendamento}) async {
    var ok = true;
    try {
      var response = await agendamentoUpdate(agendamento: agendamento);

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

  Future<bool> cancel({required int? id}) async {
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

  Future<String> hasAgendamento() async {
    var userId = await secureStorage.read(key: "CURRENT_USER_ID") ?? "0";
    String hasAgendamento = "";
    try {
      var response = await hasAgendamentoAtivo(userId: int.parse(userId));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        hasAgendamento = data["operacao"];
      } else {
        throw Exception("Deu ruim");
      }
    } catch (e) {
      print(e);
    }

    return hasAgendamento;
  }

  void shareMsg(BuildContext context, String data) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
        "Olá, estou compartilhando meu checkin agendado para $data",
        subject: "Check-in",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  void createEvent(String data, String destino) {
    final Event event = Event(
      title: 'Check-in',
      description: 'Olá, você tem um check-in agendado',
      location: destino,
      startDate: DateTime.parse(data),
      endDate: DateTime.parse(data),
      iosParams: const IOSParams(
        reminder:
            Duration(), // on iOS, you can set alarm notification after your event.
        url: '', // on iOS, you can set url to your event.
      ),
      androidParams: const AndroidParams(
        emailInvites: [], // on Android, you can add invite emails to your event.
      ),
    );

    Add2Calendar.addEvent2Cal(event);
  }
}
