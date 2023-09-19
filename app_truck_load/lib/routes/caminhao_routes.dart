import 'dart:convert';
import 'package:app_truck_load/model/caminhao_model.dart';
import 'package:app_truck_load/utilities/consts.dart';

import 'package:http/http.dart' as http;

Future<List<Caminhao>> caminhaoList() async {
  const urlCaminhao = "caminhao/list";

  final response = await http.post(Uri.parse(Consts.url + urlCaminhao));

  if (response.statusCode == 200) {
    List<Caminhao> caminhoes = (json.decode(response.body) as List)
        .map((data) => Caminhao.fromJson(data))
        .toList();
    return caminhoes;
  } else {
    throw Exception("Deu ruim");
  }
}

Future<Caminhao> caminhaoStore() async {
  const urlCaminhao = "caminhao/store";

  final response = await http.post(Uri.parse(Consts.url + urlCaminhao));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (data.sucesso) {
      return Caminhao.fromJson(data.caminhao);
    } else {
      throw Exception(data.mensagem);
    }
  } else {
    throw Exception("Deu ruim");
  }
}

Future caminhaoUpdate() async {
  const urlCaminhao = "caminhao/update";

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

Future caminhaoDestroy() async {
  const urlCaminhao = "caminhao/destroy";

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
