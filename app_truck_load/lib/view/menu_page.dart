import 'package:app_truck_load/view/cheguei_page.dart';
import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:flutter/material.dart';

import '../controller/AgendamentoController.dart';
import 'agendar_page.dart';
import 'caminhao_list_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  AgendamentoController agendamentoController = AgendamentoController();

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
          height: MediaQuery.of(context).size.height / 1.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 12,
                  child: FilledButton(
                    onPressed: () async {
                      if (await agendamentoController.hasAgendamento()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChegueiPage()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AgendarPage()));
                      }
                    },
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Agendar",
                            style: TextStyle(
                              fontFamily: "Lalezar",
                              fontSize: 30,
                            ))),
                    style: FilledButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Color.fromARGB(255, 44, 44, 216)),
                  )),
              SizedBox(height: 100),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 12,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CaminhaoListPage()));
                    },
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Meus Caminhões",
                            style: TextStyle(
                              fontFamily: "Lalezar",
                              fontSize: 30,
                            ))),
                    style: FilledButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 30,
                      ),
                      backgroundColor: Color.fromARGB(255, 44, 44, 216),
                    ),
                  )),
            ],
          ),
        ))));
  }
}
