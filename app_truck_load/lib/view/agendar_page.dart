import 'package:app_truck_load/controller/AgendamentoController.dart';
import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import 'cheguei_page.dart';

class AgendarPage extends StatefulWidget {
  const AgendarPage({super.key});

  @override
  State<AgendarPage> createState() => _AgendarPageState();
}

class _AgendarPageState extends State<AgendarPage> {
  TextEditingController controller = TextEditingController();
  AgendamentoController agendamentoController = AgendamentoController();

  String placa = "";
  String carreta = "";
  String destino = "";
  String notaFiscal = "";
  String dataAgendada = "";
  int cargaDescarga = 0;

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
                Text("Agendar",
                    style: TextStyle(
                        fontFamily: "Lalezar",
                        fontSize: 30,
                        color: Color.fromARGB(255, 44, 44, 216))),
                SizedBox(height: 50),
                TextField(
                  maxLength: 7,
                  textCapitalization: TextCapitalization.characters,
                  onChanged: (text) {
                    placa = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Placa do Caminhao"),
                ),
                SizedBox(height: 20),
                TextField(
                  maxLength: 7,
                  textCapitalization: TextCapitalization.characters,
                  onChanged: (text) {
                    carreta = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Placa da Carreta"),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (text) {
                    destino = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Destino"),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (text) {
                    dataAgendada = text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Data",
                      hintText: "YYYY-MM-DD HH:MM:SS"),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller,
                  onChanged: (text) {
                    controller.text = text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Nota Fiscal"),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 16,
                  child: OutlinedButton(
                      onPressed: () async {
                        var res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SimpleBarcodeScannerPage(),
                            ));
                        setState(() {
                          if (res is String) {
                            controller.text = res;
                          }
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black45)),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Icon(Icons.camera_alt,
                            size: MediaQuery.of(context).size.width / 10,
                            color: const Color.fromARGB(255, 12, 1, 1)),
                      )),
                ),
                const SizedBox(height: 20),
                RadioListTile<int>(
                  title: const Text('Carga'),
                  value: 0,
                  groupValue: cargaDescarga,
                  onChanged: (int? value) {
                    setState(() {
                      cargaDescarga = value ?? 0;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text('Descarga'),
                  value: 1,
                  groupValue: cargaDescarga,
                  onChanged: (int? value) {
                    setState(() {
                      cargaDescarga = value ?? 0;
                    });
                  },
                ),
                SizedBox(height: 60),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 10,
                    child: FilledButton(
                      onPressed: () async {
                        EasyLoading.show(status: 'loading...');
                        if (await agendamentoController.addAgendamento(
                            placa: placa,
                            placaCarreta: carreta,
                            destino: destino,
                            data: dataAgendada,
                            notaFiscal: controller.text,
                            tipo: cargaDescarga)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChegueiPage()),
                          );
                        } else {
                          EasyLoading.dismiss();
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                      title: const Text(
                                          'Falha ao salvar caminhão'),
                                      content: const Text(
                                          "Tente novamente mais tarde.\nLembrando que só é possivel realizar\ncheckin para os caminhões\nadicionados para o atual usuario"),
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
                          child: Text("Agendar",
                              style: TextStyle(
                                fontFamily: "Lalezar",
                                fontSize: 40,
                              ))),
                      style: FilledButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Color.fromARGB(255, 44, 44, 216)),
                    )),
              ],
            ),
          ),
        )));
  }
}
