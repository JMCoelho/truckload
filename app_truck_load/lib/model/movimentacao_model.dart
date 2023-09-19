// To parse this JSON data, do
//
//     final movimentacao = movimentacaoFromJson(jsonString);

import 'dart:convert';

Movimentacao movimentacaoFromJson(String str) =>
    Movimentacao.fromJson(json.decode(str));

String movimentacaoToJson(Movimentacao data) => json.encode(data.toJson());

class Movimentacao {
  DateTime entrada;
  DateTime entradaFabrica;
  DateTime entradaCarregamento;
  DateTime saidaCarregamento;
  DateTime saidaFabrica;
  DateTime saida;
  int agendamentoId;
  int caminhaoId;
  int userId;

  Movimentacao({
    required this.entrada,
    required this.entradaFabrica,
    required this.entradaCarregamento,
    required this.saidaCarregamento,
    required this.saidaFabrica,
    required this.saida,
    required this.agendamentoId,
    required this.caminhaoId,
    required this.userId,
  });

  factory Movimentacao.fromJson(Map<String, dynamic> json) => Movimentacao(
        entrada: DateTime.parse(json["entrada"]),
        entradaFabrica: DateTime.parse(json["entrada_fabrica"]),
        entradaCarregamento: DateTime.parse(json["entrada_carregamento"]),
        saidaCarregamento: DateTime.parse(json["saida_carregamento"]),
        saidaFabrica: DateTime.parse(json["saida_fabrica"]),
        saida: DateTime.parse(json["saida"]),
        agendamentoId: json["agendamento_id"],
        caminhaoId: json["caminhao_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "entrada": entrada,
        "entrada_fabrica": entradaFabrica,
        "entrada_carregamento": entradaCarregamento,
        "saida_carregamento": saidaCarregamento,
        "saida_fabrica": saidaFabrica,
        "saida": saida,
        "agendamento_id": agendamentoId,
        "caminhao_id": caminhaoId,
        "user_id": userId,
      };
}
