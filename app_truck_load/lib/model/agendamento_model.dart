// To parse this JSON data, do
//
//     final agendamento = agendamentoFromJson(jsonString);

import 'dart:convert';

Agendamento agendamentoFromJson(String str) =>
    Agendamento.fromJson(json.decode(str));

String agendamentoToJson(Agendamento data) => json.encode(data.toJson());

class Agendamento {
  String id;
  String placa;
  String carreta;
  String notaFiscal;
  String userId;
  DateTime dataAgendada;
  String status;

  Agendamento({
    required this.id,
    required this.placa,
    required this.carreta,
    required this.notaFiscal,
    required this.userId,
    required this.dataAgendada,
    required this.status,
  });

  factory Agendamento.fromJson(Map<String, dynamic> json) => Agendamento(
        id: json["id"],
        placa: json["placa"],
        carreta: json["carreta"],
        notaFiscal: json["nota_fiscal"],
        userId: json["user_id"],
        dataAgendada: DateTime.parse(json["data_agendada"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "placa": placa,
        "carreta": carreta,
        "nota_fiscal": notaFiscal,
        "user_id": userId,
        "data_agendada": dataAgendada.toIso8601String(),
        "status": status,
      };
}
