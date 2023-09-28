import 'dart:convert';

import 'package:app_truck_load/model/agendamento_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/movimentacao_model.dart';
import '../routes/movimentacao_routes.dart';

class MovimentacoesController {
  static const secureStorage = FlutterSecureStorage();

  Future<Movimentacao> show() async {
    var userId = await secureStorage.read(key: "CURRENT_USER_ID") ?? "0";

    Movimentacao movimentacao =
        Movimentacao(userId: 0, agendamentoId: 0, caminhaoId: 0, id: 0);

    try {
      var response = await movimentacaoShow(userId: int.parse(userId));

      if (response.statusCode == 200) {
        movimentacao = Movimentacao.fromJson(json.decode(response.body));
      } else {
        throw Exception("Deu ruim");
      }
    } catch (e) {
      print(e);
    }

    return movimentacao;
  }

  Future<bool> addMovimentacao({
    required Agendamento? agendamento,
  }) async {
    var ok = true;
    try {
      var response = await movimentacaoStore(agendamento: agendamento);

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

  Future<bool> updateMovimentacao({required Movimentacao movimentacao}) async {
    var ok = true;
    try {
      var response = await movimentacaoUpdate(movimentacao: movimentacao);

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

  bool validate(Movimentacao? movimentacao) {
    return movimentacao!.saida != null;
  }
}
