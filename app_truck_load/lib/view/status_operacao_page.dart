import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusOpercaoPage extends StatefulWidget {
  const StatusOpercaoPage({super.key});

  @override
  State<StatusOpercaoPage> createState() => _StatusOpercaoPageState();
}

class _StatusOpercaoPageState extends State<StatusOpercaoPage> {
  TextEditingController controller = TextEditingController();
  int? cargaDescarga = 0;

  final String assetElipseName = 'img/elipse.svg';
  final String assetFilledElipseName = 'img/filled_elipse.svg';

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
                const Text("Status da Operação",
                    style: TextStyle(
                        fontFamily: "Lalezar",
                        fontSize: 30,
                        color: Color.fromARGB(255, 44, 44, 216))),
                const SizedBox(height: 70),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 10,
                            alignment: WrapAlignment.start,
                            children: [
                              SvgPicture.asset("img/elipse.svg"),
                              Text("Saida da unidade: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Text("",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))
                            ],
                          )),
                      const SizedBox(height: 30),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 10,
                            children: [
                              SvgPicture.asset("img/elipse.svg"),
                              Text("Saida da fábrica: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Text("",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))
                            ],
                          )),
                      const SizedBox(height: 30),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 10,
                            children: [
                              SvgPicture.asset("img/elipse.svg"),
                              Text("Fim da carga/descarga: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Text("",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))
                            ],
                          )),
                      const SizedBox(height: 30),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 10,
                            children: [
                              SvgPicture.asset("img/elipse.svg"),
                              Text("Inicio da carga/descarga: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Text("",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))
                            ],
                          )),
                      const SizedBox(height: 30),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 10,
                            children: [
                              SvgPicture.asset("img/elipse.svg"),
                              Text("Entrada na fábrica: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Text("",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))
                            ],
                          )),
                      const SizedBox(height: 30),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 10,
                            children: [
                              SvgPicture.asset("img/elipse.svg"),
                              Text("Entrada na unidade: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Text("",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.35,
                    height: MediaQuery.of(context).size.height / 15,
                    child: FilledButton(
                      onPressed: () {},
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
