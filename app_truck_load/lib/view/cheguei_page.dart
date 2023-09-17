import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:app_truck_load/view/status_operacao_page.dart';
import 'package:flutter/material.dart';

class ChegueiPage extends StatefulWidget {
  const ChegueiPage({super.key});

  @override
  State<ChegueiPage> createState() => _ChegueiPageState();
}

class _ChegueiPageState extends State<ChegueiPage> {
  TextEditingController controller = TextEditingController();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          //TODO
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {
                          //TODO
                        },
                      ),
                    ])),
                const SizedBox(height: 20),
                Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: const Column(
                      children: [
                        SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Horario Agendado:",
                                style: TextStyle(fontSize: 20))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("12-07-2023 16:00:00",
                                style: TextStyle(fontSize: 20))),
                        SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Placa do caminhão:",
                                style: TextStyle(fontSize: 20))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("AAA1111",
                                style: TextStyle(fontSize: 20))),
                        SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Placa da Carreta:",
                                style: TextStyle(fontSize: 20))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("AAA1111",
                                style: TextStyle(fontSize: 20))),
                        SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Nota Fiscal:",
                                style: TextStyle(fontSize: 20))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "44444444444444444444444444444444444444444444444444444",
                                style: TextStyle(fontSize: 20))),
                        SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerLeft,
                            child:
                                Text("Tipo:", style: TextStyle(fontSize: 20))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child:
                                Text("Carga", style: TextStyle(fontSize: 20))),
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
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor:
                                    const Color.fromARGB(255, 44, 44, 216)),
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
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor:
                                    const Color.fromARGB(255, 247, 0, 0)),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StatusOpercaoPage()),
                        );
                      },
                      style: FilledButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor:
                              const Color.fromARGB(255, 44, 44, 216)),
                      child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text("Entrar na unidade",
                              style: TextStyle(
                                fontFamily: "Lalezar",
                                fontSize: 30,
                              ))),
                    )),
              ],
            ),
          ),
        )));
  }
}
