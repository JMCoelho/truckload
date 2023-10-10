import 'package:app_truck_load/controller/AgendamentoController.dart';
import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../model/agendamento_model.dart';
import 'cheguei_page.dart';

class EditarAgendamentoPage extends StatefulWidget {
  const EditarAgendamentoPage({super.key, required this.agendamento});
  final Agendamento agendamento;

  @override
  State<EditarAgendamentoPage> createState() => _EditarAgendamentoPageState();
}

class _EditarAgendamentoPageState extends State<EditarAgendamentoPage> {
  TextEditingController nfController = TextEditingController();
  TextEditingController carretaController = TextEditingController();
  AgendamentoController agendamentoController = AgendamentoController();

  @override
  Widget build(BuildContext context) {
    carretaController.text = widget.agendamento.carreta;
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
                Text("Atualizar Agendamento",
                    style: TextStyle(
                        fontFamily: "Lalezar",
                        fontSize: 30,
                        color: Color.fromARGB(255, 44, 44, 216))),
                SizedBox(height: 50),
                TextField(
                  controller: carretaController,
                  onChanged: (text) {
                    widget.agendamento.carreta = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Placa da Carreta"),
                ),
                SizedBox(height: 120),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 10,
                    child: FilledButton(
                      onPressed: () async {
                        EasyLoading.show(status: 'loading...');
                        if (await agendamentoController.updateAgendamento(
                            agendamento: widget.agendamento)) {
                          EasyLoading.dismiss();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChegueiPage()),
                          );
                        } else {
                          EasyLoading.dismiss();
                        }
                      },
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text("Atualizar",
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
