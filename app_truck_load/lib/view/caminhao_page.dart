import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../controller/CaminhaoController.dart';
import 'caminhao_list_page.dart';

class CaminhaoPage extends StatefulWidget {
  const CaminhaoPage({super.key});

  @override
  State<CaminhaoPage> createState() => _CaminhaoPageState();
}

class _CaminhaoPageState extends State<CaminhaoPage> {
  CaminhaoController caminhaoController = CaminhaoController();
  String placa = "";
  String transportadora = "";
  String tipoCaminhao = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideBarMenu(),
        appBar: AppBar(
          title: Text('Truck Load'),
          backgroundColor: Color.fromARGB(255, 44, 44, 216),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text("Caminhão",
                    style: TextStyle(
                        fontFamily: "Lalezar",
                        fontSize: 30,
                        color: Color.fromARGB(255, 44, 44, 216))),
                SizedBox(height: 70),
                TextField(
                  maxLength: 7,
                  textCapitalization: TextCapitalization.characters,
                  onChanged: (text) {
                    placa = text.toUpperCase();
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Placa do Caminhao"),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (text) {
                    transportadora = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Transportadora"),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (text) {
                    tipoCaminhao = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Tipo"),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 3),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 15,
                      child: FilledButton(
                        onPressed: () async {
                          EasyLoading.show(status: 'loading...');
                          if (await caminhaoController.addCaminhao(
                              placa: placa,
                              transportadora: transportadora,
                              tipoCaminhao: tipoCaminhao)) {
                            EasyLoading.dismiss();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CaminhaoListPage()),
                            );
                          } else {
                            EasyLoading.dismiss();
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                        title: const Text(
                                            'Falha ao salvar caminhão'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('Cancel'),
                                          ),
                                        ]));
                          }
                        },
                        child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("Salvar",
                                style: TextStyle(
                                  fontFamily: "Lalezar",
                                  fontSize: 30,
                                ))),
                        style: FilledButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Color.fromARGB(255, 44, 44, 216)),
                      )),
                )
              ],
            ),
          ),
        )));
  }
}
