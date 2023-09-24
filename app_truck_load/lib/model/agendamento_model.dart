// To parse this JSON data, do
//
//     final agendamento = agendamentoFromJson(jsonString);

import 'dart:convert';

Agendamento agendamentoFromJson(String str) =>
    Agendamento.fromJson(json.decode(str));

String agendamentoToJson(Agendamento data) => json.encode(data.toJson());

class Agendamento {
  int? id;
  String placa;
  String carreta;
  String notaFiscal;
  String destino;
  int tipo;

  String userId;
  DateTime dataAgendada;
  int status;

  Agendamento({
    required this.placa,
    required this.carreta,
    required this.notaFiscal,
    required this.destino,
    required this.userId,
    required this.dataAgendada,
    required this.status,
    required this.tipo,
    this.id,
  });

  factory Agendamento.fromJson(Map<String, dynamic> json) => Agendamento(
      id: json["id"],
      placa: json["placa"],
      carreta: json["carreta"],
      notaFiscal: json["nota_fiscal"],
      destino: json["destino"],
      userId: json["user_id"],
      dataAgendada: DateTime.parse(json["data_agendada"]),
      status: json["status"],
      tipo: json["tipo"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "placa": placa,
        "carreta": carreta,
        "nota_fiscal": notaFiscal,
        "destino": destino,
        "user_id": userId,
        "data_agendada": dataAgendada.toIso8601String(),
        "status": status,
        "tipo": tipo
      };
}
