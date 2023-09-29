import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/MovimentacoesController.dart';
import '../model/movimentacao_model.dart';
import 'menu_page.dart';

class StatusOpercaoPage extends StatefulWidget {
  const StatusOpercaoPage({super.key});

  @override
  State<StatusOpercaoPage> createState() => _StatusOpercaoPageState();
}

class _StatusOpercaoPageState extends State<StatusOpercaoPage> {
  TextEditingController controller = TextEditingController();
  MovimentacoesController movimentacaoController = MovimentacoesController();

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
              child: FutureBuilder<Movimentacao>(
                  future: movimentacaoController.show(),
                  builder: (BuildContext context,
                      AsyncSnapshot<Movimentacao> snapshot) {
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
                  })),
        )));
  }

  Widget pageInformation(
      BuildContext context, AsyncSnapshot<Movimentacao> snapshot) {
    const String assetElipseName = 'img/elipse.svg';
    const String assetFilledElipseName = 'img/filled_elipse.svg';
    String buttonText = chooseButtonText(snapshot);
    return Column(
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
                      SvgPicture.asset(snapshot.data?.saida != null
                          ? assetFilledElipseName
                          : assetElipseName),
                      Text("Saida da unidade: ",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(snapshot.data!.saida ?? "",
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
                      SvgPicture.asset(snapshot.data?.saidaFabrica != null
                          ? assetFilledElipseName
                          : assetElipseName),
                      Text("Saida da fábrica: ",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(snapshot.data!.saidaFabrica ?? "",
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
                      SvgPicture.asset(snapshot.data?.saidaCarregamento != null
                          ? assetFilledElipseName
                          : assetElipseName),
                      Text("Fim da carga/descarga: ",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(snapshot.data!.saidaCarregamento ?? "",
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
                      SvgPicture.asset(
                          snapshot.data?.entradaCarregamento != null
                              ? assetFilledElipseName
                              : assetElipseName),
                      Text("Inicio da carga/descarga: ",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(snapshot.data!.entradaCarregamento ?? "",
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
                      SvgPicture.asset(snapshot.data?.entradaFabrica != null
                          ? assetFilledElipseName
                          : assetElipseName),
                      Text("Entrada na fábrica: ",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(snapshot.data!.entradaFabrica ?? "",
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
                      SvgPicture.asset(snapshot.data?.entrada != null
                          ? assetFilledElipseName
                          : assetElipseName),
                      Text("Entrada na unidade: ",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(snapshot.data!.entrada ?? "",
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
              onPressed: () async {
                if (buttonText == "Finalizar") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuPage()));
                } else {
                  await movimentacaoController.updateMovimentacao(
                      movimentacao: snapshot.data!);
                  setState(() {});
                }
              },
              style: FilledButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: const Color.fromARGB(255, 44, 44, 216)),
              child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(buttonText,
                      style: TextStyle(
                        fontFamily: "Lalezar",
                        fontSize: 30,
                      ))),
            )),
      ],
    );
  }

  String chooseButtonText(AsyncSnapshot<Movimentacao> snapshot) {
    if (snapshot.data!.entradaFabrica == null) {
      return "Entrar na fábrica";
    } else if (snapshot.data!.entradaCarregamento == null) {
      return "Iniciar Carregamento";
    } else if (snapshot.data!.saidaCarregamento == null) {
      return "Finalizar Carregamento";
    } else if (snapshot.data!.saidaFabrica == null) {
      return "Sair da Fábrica";
    } else if (snapshot.data!.saida == null) {
      return "Sair da unidade";
    } else {
      return "Finalizar";
    }
  }
}
