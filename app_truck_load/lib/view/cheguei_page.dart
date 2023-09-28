import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:app_truck_load/view/status_operacao_page.dart';
import 'package:flutter/material.dart';

import '../controller/AgendamentoController.dart';
import '../controller/MovimentacoesController.dart';
import '../model/agendamento_model.dart';
import 'editar_agendamento_page.dart';
import 'menu_page.dart';

class ChegueiPage extends StatefulWidget {
  const ChegueiPage({super.key});

  @override
  State<ChegueiPage> createState() => _ChegueiPageState();
}

class _ChegueiPageState extends State<ChegueiPage> {
  TextEditingController controller = TextEditingController();
  AgendamentoController agendamentoController = AgendamentoController();
  MovimentacoesController movimentacaoController = MovimentacoesController();

  int? cargaDescarga = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideBarMenu(),
        appBar: AppBar(
          title: const Text('Truck Load'),
          backgroundColor: const Color.fromARGB(255, 44, 44, 216),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: FutureBuilder<Agendamento>(
                  future: agendamentoController.show(),
                  builder: (BuildContext context,
                      AsyncSnapshot<Agendamento> snapshot) {
                    try {
                      if (snapshot.hasData) {
                        return pageInformation(context, snapshot);
                      } else {
                        return SizedBox();
                      }
                    } catch (e) {
                      print(e);
                      return SizedBox();
                    }
                  }),
            ),
          ),
        ));
  }

  Widget pageInformation(
      BuildContext context, AsyncSnapshot<Agendamento> snapshot) {
    int? tipo = snapshot.data?.tipo ?? 0;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(height: 20),
      const Text("Cheguei",
          style: TextStyle(
              fontFamily: "Lalezar",
              fontSize: 30,
              color: Color.fromARGB(255, 44, 44, 216))),
      const SizedBox(height: 50),
      Align(
          alignment: Alignment.centerLeft,
          child: Wrap(spacing: 20, children: [
            IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: () {
                agendamentoController.createEvent(
                    snapshot.data!.dataAgendada, snapshot.data!.destino);
              },
            ),
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () async {
                agendamentoController.shareMsg(
                    context, snapshot.data!.dataAgendada);
              },
            ),
          ])),
      const SizedBox(height: 20),
      Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Horario Agendado:",
                      style: TextStyle(fontSize: 20))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(snapshot.data?.dataAgendada ?? "",
                      style: TextStyle(fontSize: 20))),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Placa do caminhão:",
                      style: TextStyle(fontSize: 20))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(snapshot.data?.placa ?? "",
                      style: TextStyle(fontSize: 20))),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Placa da Carreta:",
                      style: TextStyle(fontSize: 20))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(snapshot.data?.carreta ?? "",
                      style: TextStyle(fontSize: 20))),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Nota Fiscal:", style: TextStyle(fontSize: 20))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(snapshot.data?.notaFiscal ?? "",
                      style: TextStyle(fontSize: 20))),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Tipo:", style: TextStyle(fontSize: 20))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(tipo == 0 ? "Carga" : "Descarga",
                      style: TextStyle(fontSize: 20))),
            ],
          )),
      const SizedBox(height: 20),
      Align(
          alignment: Alignment.center,
          child: Wrap(spacing: 30, children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 15,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditarAgendamentoPage(
                              agendamento: snapshot.data!)),
                    );
                  },
                  style: FilledButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: const Color.fromARGB(255, 44, 44, 216)),
                  child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text("Editar",
                          style: TextStyle(
                            fontFamily: "Lalezar",
                            fontSize: 30,
                          ))),
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 15,
                child: FilledButton(
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                title: const Text('Cancelar agendamento'),
                                content: const Text(
                                    "A ação de cancelar o agendamento é irreversivel"),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text('Cancelar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text('Prosseguir'),
                                    onPressed: () async {
                                      if (await agendamentoController.cancel(
                                          id: snapshot.data!.id)) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MenuPage()),
                                        );
                                      }
                                    },
                                  ),
                                ]));
                  },
                  style: FilledButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: const Color.fromARGB(255, 247, 0, 0)),
                  child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text("Cancelar",
                          style: TextStyle(
                            fontFamily: "Lalezar",
                            fontSize: 30,
                          ))),
                )),
          ])),
      const SizedBox(height: 20),
      SizedBox(
          width: MediaQuery.of(context).size.width / 1.35,
          height: MediaQuery.of(context).size.height / 10,
          child: FilledButton(
            onPressed: () async {
              if (await movimentacaoController.addMovimentacao(
                  agendamento: snapshot.data)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StatusOpercaoPage()),
                );
              } else {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            title: const Text('Falha ao entrar na unidade'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('Cancel'),
                              ),
                            ]));
              }
            },
            style: FilledButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: const Color.fromARGB(255, 44, 44, 216)),
            child: const FittedBox(
                fit: BoxFit.fitWidth,
                child: Text("Entrar na unidade",
                    style: TextStyle(
                      fontFamily: "Lalezar",
                      fontSize: 30,
                    ))),
          )),
    ]);
  }
}
