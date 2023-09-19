// To parse this JSON data, do
//
//     final caminhao = caminhaoFromJson(jsonString);

import 'dart:convert';

Caminhao caminhaoFromJson(String str) => Caminhao.fromJson(json.decode(str));

String caminhaoToJson(Caminhao data) => json.encode(data.toJson());

class Caminhao {
  String placa;
  String transportadora;
  String tipo;
  int userId;
  int id;

  Caminhao({
    required this.placa,
    required this.transportadora,
    required this.tipo,
    required this.userId,
    required this.id,
  });

  factory Caminhao.fromJson(Map<String, dynamic> json) => Caminhao(
        placa: json["placa"],
        transportadora: json["transportadora"],
        tipo: json["tipo"],
        userId: json["user_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "placa": placa,
        "transportadora": transportadora,
        "tipo": tipo,
        "user_id": userId,
        "id": id,
      };
}
