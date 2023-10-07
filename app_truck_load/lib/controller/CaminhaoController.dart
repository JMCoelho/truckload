import 'dart:convert';

import 'package:app_truck_load/model/caminhao_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/caminhao_routes.dart';

class CaminhaoController {
  static Future<List<Caminhao>> list() async {
    final prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString("CURRENT_USER_ID") ?? "0";

    try {
      var response = await caminhaoList(userId: int.parse(userId));

      if (response.statusCode == 200) {
        List<Caminhao> caminhoes = (json.decode(response.body) as List)
            .map((data) => Caminhao.fromJson(data))
            .toList();

        return caminhoes;
      } else {
        throw Exception("Deu ruim");
      }
    } catch (e) {
      print(e);
    }

    List<Caminhao> list = [];
    return list;
  }

  Future<bool> addCaminhao(
      {required String placa,
      required String transportadora,
      required String tipoCaminhao}) async {
    final prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString("CURRENT_USER_ID") ?? "0";
    ;

    Caminhao caminhao = Caminhao(
        placa: placa,
        transportadora: transportadora,
        tipo: tipoCaminhao,
        userId: userId);

    var ok = true;
    try {
      var response = await caminhaoStore(caminhao: caminhao);

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

  Future<bool> updateCaminhao({required Caminhao caminhao}) async {
    var ok = true;
    try {
      var response = await caminhaoUpdate(caminhao: caminhao);

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

  Future<bool> deleteCaminhao({required int id}) async {
    var ok = true;
    try {
      var response = await caminhaoDestroy(id: id);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (!data["sucesso"]) {
          throw Exception(data["mensagem"]);
        }
      }
    } catch (e) {
      print(e);
      ok = false;
    }

    return ok;
  }
}
