import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:flutter/material.dart';

import 'caminhao_page.dart';

class CaminhaoListPage extends StatefulWidget {
  const CaminhaoListPage({super.key});

  @override
  State<CaminhaoListPage> createState() => _CaminhaoListPageState();
}

class _CaminhaoListPageState extends State<CaminhaoListPage> {
  TextEditingController controller = TextEditingController();
  int? cargaDescarga = 0;

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
                Text("Meus Caminhões",
                    style: TextStyle(
                        fontFamily: "Lalezar",
                        fontSize: 30,
                        color: Color.fromARGB(255, 44, 44, 216))),
                SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        onChanged: (text) {
                          text;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Placa"),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          //TODO
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10,
                              children: [
                                Text("AAA1111", style: TextStyle(fontSize: 30)),
                                OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                        side:
                                            BorderSide(color: Colors.black45)),
                                    child: Icon(Icons.edit_document,
                                        color: Colors.black87)),
                                OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                        side:
                                            BorderSide(color: Colors.black87)),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    ))
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CaminhaoPage()),
            );
          },
          tooltip: 'Adicionar novo Caminhao',
          child: const Icon(Icons.add),
        ));
  }
}
