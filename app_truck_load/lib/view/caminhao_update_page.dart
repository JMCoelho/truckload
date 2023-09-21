import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:flutter/material.dart';

import '../controller/CaminhaoController.dart';
import '../model/caminhao_model.dart';
import 'caminhao_list_page.dart';

class CaminhaoUpdatePage extends StatefulWidget {
  const CaminhaoUpdatePage({super.key, required this.caminhao});
  final Caminhao caminhao;

  @override
  State<CaminhaoUpdatePage> createState() => _CaminhaoUpdatePageState();
}

class _CaminhaoUpdatePageState extends State<CaminhaoUpdatePage> {
  CaminhaoController caminhaoController = CaminhaoController();

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
                  controller: TextEditingController(
                      text: widget.caminhao.transportadora),
                  onChanged: (text) {
                    widget.caminhao.transportadora = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Transportadora"),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: TextEditingController(text: widget.caminhao.tipo),
                  onChanged: (text) {
                    widget.caminhao.tipo = text;
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
                          if (await caminhaoController.updateCaminhao(
                              caminhao: widget.caminhao)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CaminhaoListPage()),
                            );
                          } else {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                        title: const Text(
                                            'Falha ao atualizar caminhão'),
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
