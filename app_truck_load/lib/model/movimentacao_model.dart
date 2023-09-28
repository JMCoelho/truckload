// To parse this JSON data, do
//
//     final movimentacao = movimentacaoFromJson(jsonString);

import 'dart:convert';

Movimentacao movimentacaoFromJson(String str) =>
    Movimentacao.fromJson(json.decode(str));

String movimentacaoToJson(Movimentacao data) => json.encode(data.toJson());

class Movimentacao {
  String? entrada;
  String? entradaFabrica;
  String? entradaCarregamento;
  String? saidaCarregamento;
  String? saidaFabrica;
  String? saida;
  int? agendamentoId;
  int? caminhaoId;
  int? userId;
  int? id;

  Movimentacao({
    this.id,
    this.agendamentoId,
    this.caminhaoId,
    this.userId,
    this.entrada,
    this.entradaFabrica,
    this.entradaCarregamento,
    this.saidaCarregamento,
    this.saidaFabrica,
    this.saida,
  });

  factory Movimentacao.fromJson(Map<String, dynamic> json) => Movimentacao(
      entrada: json["entrada"],
      entradaFabrica: json["entrada_fabrica"],
      entradaCarregamento: json["entrada_carregamento"],
      saidaCarregamento: json["saida_carregamento"],
      saidaFabrica: json["saida_fabrica"],
      saida: json["saida"],
      agendamentoId: int.parse(json["agendamento_id"]),
      caminhaoId: int.parse(json["caminhao_id"]),
      userId: int.parse(json["user_id"]),
      id: json["id"]);

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
