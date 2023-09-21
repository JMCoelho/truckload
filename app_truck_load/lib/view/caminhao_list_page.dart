import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:flutter/material.dart';

import '../controller/CaminhaoController.dart';
import '../model/caminhao_model.dart';
import 'caminhao_page.dart';
import 'caminhao_update_page.dart';

class CaminhaoListPage extends StatefulWidget {
  const CaminhaoListPage({super.key});

  @override
  State<CaminhaoListPage> createState() => _CaminhaoListPageState();
}

class _CaminhaoListPageState extends State<CaminhaoListPage> {
  CaminhaoController caminhaoController = CaminhaoController();
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
                    child: FutureBuilder<List<Caminhao>>(
                        future: caminhaoController.list(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Caminhao>> snapshot) {
                          try {
                            if (snapshot.hasData) {
                              return singleChildScrollViewVeiculos(
                                  context, snapshot);
                            } else {
                              return SizedBox();
                            }
                          } catch (e) {
                            print(e);
                            return SizedBox();
                          }
                        })),
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

  SingleChildScrollView singleChildScrollViewVeiculos(
      BuildContext context, AsyncSnapshot<List<Caminhao>> snapshot) {
    return SingleChildScrollView(
      child: Column(
        children: listVeiculos(context, snapshot),
      ),
    );
  }

  List<Widget> listVeiculos(
      BuildContext context, AsyncSnapshot<List<Caminhao>> snapshot) {
    List<Widget> widgets = [];
    snapshot.data?.forEach((element) {
      var container = Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 20,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: [
              Text(element.placa, style: TextStyle(fontSize: 30)),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CaminhaoUpdatePage(caminhao: element)),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black45)),
                  child: Icon(Icons.edit_document, color: Colors.black87)),
              OutlinedButton(
                  onPressed: () {
                    _dialogDeleteBuilder(context, element.id);
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black87)),
                  child: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ))
            ],
          ));
      var sizedbox = const SizedBox(height: 10);

      widgets.add(container);
      widgets.add(sizedbox);
    });
    return widgets;
  }

  Future<void> _dialogDeleteBuilder(BuildContext context, int id) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tem certeza que deseja remover o veículo?'),
          content: const Text(
            'Essa ação não pode ser desfeita posteriormente',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Prosseguir'),
              onPressed: () async {
                Navigator.of(context).pop();
                if (await caminhaoController.deleteCaminhao(id: id)) {
                  setState(() {});
                }
              },
            ),
          ],
        );
      },
    );
  }
}
