import 'dart:convert';
import 'package:app_truck_load/model/movimentacao_model.dart';
import 'package:app_truck_load/utilities/consts.dart';

import 'package:http/http.dart' as http;

Future<Movimentacao> movimentacaoStore() async {
  const urlMovimentacao = "movimentacao/store";

  final response = await http.post(Uri.parse(Consts.url + urlMovimentacao));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (!data.sucesso) {
      return Movimentacao.fromJson(data.movimentacao);
    } else {
      throw Exception(data.mensagem);
    }
  } else {
    throw Exception("Deu ruim");
  }
}

Future movimentacaoUpdate() async {
  const urlMovimentacao = "Movimentacao/update";

  final response = await http.post(Uri.parse(Consts.url + urlMovimentacao));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (!data.sucesso) {
      throw Exception(data.mensagem);
    }
  } else {
    throw Exception("Deu ruim");
  }
}
